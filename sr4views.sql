create view CharacterFinalAttributes as select
  Characters.CharacterID as CharacterID,
  CharacterAttributes.BodyAttr + Metatypes.BaseBody as FinalBody,
  CharacterAttributes.Agility + Metatypes.BaseAgility as FinalAgility,
CharacterAttributes.Strength + Metatypes.BaseStrength as FinalStrength,
CharacterAttributes.Reaction + Metatypes.BaseReaction as FinalReaction,
CharacterAttributes.Logic + Metatypes.BaseLogic as FinalLogic,
CharacterAttributes.Intuition + Metatypes.BaseIntuition as FinalIntuition,
CharacterAttributes.Charisma + Metatypes.BaseCharisma as FinalCharisma,
CharacterAttributes.Willpower + Metatypes.BaseWillpower as FinalWillpower,
CharacterAttributes.Edge + Metatypes.BaseEdge as FinalEdge,
CharacterAttributes.Magic as Magic,
CharacterAttributes.Resonance as Resonance
from Characters
left outer join Metatypes on Characters.Metatype = Metatypes.Name
left outer join CharacterAttributes on Characters.CharacterID = CharacterAttributes.CharacterID;
  
create view ViewConnectionCost as select     
	CharacterID,     
    sum(Rating) + sum(Influence) as BP
from CharacterConnections
group by CharacterID;
    
create view ViewAttributeCost as select
	Characters.CharacterID,
           case when CharacterFinalAttributes.FinalBody < Metatypes.MaxBody then (CharacterAttributes.BodyAttr * 10)
			else (CharacterAttributes.BodyAttr * 10 + 15) end + 
		case when CharacterFinalAttributes.FinalAgility < Metatypes.MaxAgility then (CharacterAttributes.Agility * 10)
			else (CharacterAttributes.Agility * 10 + 15) end +
                case when CharacterFinalAttributes.FinalStrength < Metatypes.MaxStrength then (CharacterAttributes.Strength * 10 )
                        else (CharacterAttributes.Strength * 10 + 15) end  +
                case when CharacterFinalAttributes.FinalReaction < Metatypes.MaxReaction then (CharacterAttributes.Reaction * 10) 
                        else (CharacterAttributes.Reaction * 10 + 15) end +
	        case when CharacterFinalAttributes.FinalIntuition < Metatypes.MaxIntuition then (CharacterAttributes.Intuition * 10 )
			else (CharacterAttributes.Intuition * 10 + 15) end + 
		case when CharacterFinalAttributes.FinalLogic < Metatypes.MaxLogic then (CharacterAttributes.Logic  * 10)
			else (CharacterAttributes.Logic * 10 + 15) end +	 
		case when CharacterFinalAttributes.FinalCharisma < Metatypes.MaxCharisma then (CharacterAttributes.Charisma * 10 )
			else (CharacterAttributes.Charisma * 10 + 15) end +
		case when CharacterFinalAttributes.FinalWillpower < Metatypes.MaxWillpower then (CharacterAttributes.Willpower  * 10 )
			else (CharacterAttributes.Willpower * 10 + 15 )end +		 
		case when CharacterFinalAttributes.FinalEdge < Metatypes.MaxEdge then (CharacterAttributes.Edge  * 10 )
			else (CharacterAttributes.Edge * 10 + 15) end +
		case when coalesce(CharacterAttributes.Magic, 0) = 0 then 0 else
		    case when CharacterAttributes.Magic < 6 then ((CharacterAttributes.Magic -1) * 10 )
			else 75 end end  +  -- can't go higher than 6 on character creation
		case when coalesce(CharacterAttributes.Resonance, 0) = 0 then 0 else 
                    case when CharacterAttributes.Resonance < 6 then ((CharacterAttributes.Resonance - 1) * 10)
 			else 75 end end	
	as BP
from Characters
	left outer join Metatypes on Characters.Metatype = Metatypes.Name
	left outer join CharacterAttributes on Characters.CharacterID = CharacterAttributes.CharacterID
	left outer join CharacterFinalAttributes on Characters.CharacterID = CharacterFinalAttributes.CharacterID
group by Characters.CharacterID;
	
create view ViewQualityCost as select
    CharacterID,
	sum(Qualities.BPCost) as BP
from CharacterQualities
	inner join Qualities on CharacterQualities.Quality = Qualities.Name
group by CharacterID;

create view CharacterActiveSkillSpecialisationCost as select 
       CharacterID,
       Skill,
       2 * count(*) as BP
       from CharacterSkills
       where CharacterSkills.Specialisation is not null 
          and exists (select Name from Skills where CharacterSkills.Skill = Skills.Name and Skills.IsActive)
       group by CharacterID;

create view CharacterKnowledgeSkillSpecialisationCost as select 
       CharacterID,
       Skill,
       count(*) as SpecCount
       from CharacterSkills
       where CharacterSkills.Specialisation is not null 
          and exists (select Name from Skills where CharacterSkills.Skill = Skills.Name and not Skills.IsActive)
       group by CharacterID;
       
       
create view ViewActiveSkillCost as select
    CharacterSkills.CharacterID,
	sum(Rating) * 4 
	+ CharacterActiveSkillSpecialisationCost.BP
	 as BP
from CharacterSkills 
	inner join Skills on CharacterSkills.Skill = Skills.Name
	inner join CharacterActiveSkillSpecialisationCost on CharacterActiveSkillSpecialisationCost.CharacterID = CharacterSkills.CharacterID --- wow, this seems really backwards, is there a better way?
	where Skills.IsActive
group by CharacterSkills.CharacterID;

create view ViewSkillGroupCost as select
     CharacterSkillGroups.CharacterID,
     10 * sum(Rating) as BP
from CharacterSkillGroups group by CharacterID;

create view ViewKnowledgeSkillCost as select
	CharacterSkills.CharacterID as CharacterID,
 	(2 * sum(Rating) 
 	 + 2 * CharacterKnowledgeSkillSpecialisationCost.SpecCount
 	 - (6 * (CharacterAttributes.Logic + CharacterAttributes.Intuition)))
	 as BP,
	 3 * (CharacterAttributes.Logic + CharacterAttributes.Intuition) as MaxAdditionalBP,
	 CreationComplete
from CharacterSkills
	inner join Skills on CharacterSkills.Skill = Skills.Name
	inner join CharacterAttributes on CharacterSkills.CharacterID = CharacterAttributes.CharacterID
	inner join Characters on Characters.CharacterID = CharacterAttributes.CharacterID
	inner join CharacterKnowledgeSkillSpecialisationCost on CharacterSkills.CharacterID = CharacterKnowledgeSkillSpecialisationCost.CharacterID
	where not Skills.IsActive
group by CharacterSkills.CharacterID;

create trigger chk_knowledge_skill_points after insert on CharacterSkills
when exists (select BP from ViewKnowledgeSkillCost where ViewKnowledgeSkillCost.CharacterID = NEW.CharacterID and BP > ViewKnowledgeSkillCost.MaxAdditionalBP and not CreationComplete)
begin
delete from CharacterSkills where CharacterID = NEW.CharacterID and Skill = NEW.Skill;
select raise(abort, 'Character may only purchase 3 * (Logic + Intuition) additional knowledge skill points');
end;

create view ViewComplexFormCost as select
     CharacterComplexForms.CharacterID,
     sum(Rating) as BP
from CharacterComplexForms
group by CharacterComplexForms.CharacterID;

create view ViewSpriteCost as select
     CharacterSprites.CharacterID,
     sum(Tasks) as BP
from CharacterSprites group by CharacterID;

create view ViewGearNuyenCost as select
   Characters.CharacterID as CharacterID,
   sum(Gear.NuyenCost * coalesce(CharacterGear.Rating, 1) * CharacterGear.Quantity) as Nuyen
from CharacterGear
  left outer join Characters on Characters.CharacterID = CharacterGear.CharacterID
  left outer join Gear on (CharacterGear.GearType = Gear.GearType and CharacterGear.GearName = Gear.GearName)
  group by Characters.CharacterID;
  
create trigger chk_nuyen after insert on CharacterGear when 250000 < (select Nuyen from ViewGearNuyenCost where CharacterID = NEW.CharacterID limit 1)
begin
  select raise(abort, 'Starting characters can only spend 250000 nuyen on gear');
 end;
  
		
create view ViewTotalCost as select
    Characters.CharacterID,
      Metatypes.BPCost
    + coalesce(ViewAttributeCost.BP, 0)
	+ coalesce(ViewQualityCost.BP, 0)
 	+ coalesce(ViewActiveSkillCost.BP, 0)
 	+ coalesce(ViewSkillGroupCost.BP, 0)
 	-- I do this here because it'd be clumsy in the view itself, and probably run the aggregate function twice.
 	-- If the character does not spend all their free knowledge skill points at creation, they could end up with
--  	-- a negative BP cost here, which we obviously don't want.
 	+ coalesce(case when ViewKnowledgeSkillCost.BP < 0 then 0 else ViewKnowledgeSkillCost.BP end, 0) 
	+ coalesce(ViewConnectionCost.BP, 0)
	+ 3 * (select count(*) from CharacterSpells)
	+ ViewComplexFormCost.BP
	+ ViewSpriteCost.BP
	+ (select (case when cast(ViewGearNuyenCost.Nuyen/5000 as int) * 5000 = ViewGearNuyenCost.Nuyen 
	                  then cast(ViewGearNuyenCost.Nuyen/5000 as int) 
	                  else 1 + cast(ViewGearNuyenCost.Nuyen/5000 as int) end)) 
	as BP
from Characters
    left outer join Metatypes on Characters.Metatype = Metatypes.Name
    left outer join ViewConnectionCost on Characters.CharacterID = ViewConnectionCost.CharacterID
    left outer join ViewAttributeCost on Characters.CharacterID = ViewAttributeCost.CharacterID
    left outer join ViewQualityCost on Characters.CharacterID = ViewQualityCost.CharacterID
    left outer join ViewActiveSkillCost on Characters.CharacterID = ViewActiveSkillCost.CharacterID
    left outer join ViewSkillGroupCost on Characters.CharacterID = ViewSkillGroupCost.CharacterID
    left outer join ViewKnowledgeSkillCost on Characters.CharacterID = ViewKnowledgeSkillCost.CharacterID
    left outer join CharacterSpells on Characters.CharacterID = CharacterSpells.CharacterID
    left outer join ViewComplexFormCost on Characters.CharacterID = ViewComplexFormCost.CharacterID
    -- left outer join ViewSpiritCost on Characters.CharacterID = ViewSpiritCost.CharacterID
    left outer join ViewSpriteCost on Characters.CharacterID = ViewSpriteCost.CharacterID
    left outer join ViewGearNuyenCost on Characters.CharacterID = ViewGearNuyenCost.CharacterID;


create view ViewEssenceCost as select
   CharacterID,
   6 - sum(Essence * EssenceMultiplier) as TotalEssence
from CharacterCyberware 
     inner join CyberwareGrades on CharacterCyberware.Grade = CyberwareGrades.Grade
     inner join Cyberware on Cyberware.Name = CharacterCyberware.Name 
group by CharacterID;


create trigger chk_attributes_insert after insert on CharacterAttributes when
(NEW.BodyAttr > (select MaxBody - BaseBody from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.BodyAttr < 0) or
(NEW.Reaction > (select MaxReaction - BaseReaction from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Reaction < 0) or
(NEW.Agility > (select MaxAgility - BaseAgility from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Agility < 0) or
(NEW.Strength > (select MaxStrength - BaseStrength from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Strength < 0) or
(NEW.Logic > (select MaxLogic - BaseLogic from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Logic < 0) or
(NEW.Intuition > (select MaxIntuition - BaseIntuition from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Intuition < 0) or
(NEW.Charisma > (select MaxCharisma - BaseCharisma from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Charisma < 0) or
(NEW.Willpower > (select MaxWillpower - BaseWillpower from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Willpower < 0) or
(NEW.Edge > (select MaxEdge - BaseEdge from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Edge < 0) or
(NEW.Magic > ((select TotalEssence from ViewEssenceCost where CharacterID = NEW.CharacterID limit 1) + (select InitiationGrade from CharacterInitiation where CharacterID = NEW.CharacterID limit 1)) or NEW.Magic < 0) or
(NEW.Resonance > ((select TotalEssence from ViewEssenceCost where CharacterID = NEW.CharacterID limit 1) + (select SubmersionGrade from CharacterSubmersion where CharacterID = NEW.CharacterID limit 1)) or NEW.Resonance < 0) 
begin
  select raise(abort, 'One or more attributes out of bounds');
end;



create trigger chk_attributes_update after update on CharacterAttributes when
(NEW.BodyAttr > (select MaxBody - BaseBody from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.BodyAttr < 0) or
(NEW.Reaction > (select MaxReaction - BaseReaction from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Reaction < 0) or
(NEW.Agility > (select MaxAgility - BaseAgility from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Agility < 0) or
(NEW.Strength > (select MaxStrength - BaseStrength from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Strength < 0) or
(NEW.Logic > (select MaxLogic - BaseLogic from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Logic < 0) or
(NEW.Intuition > (select MaxIntuition - BaseIntuition from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Intuition < 0) or
(NEW.Charisma > (select MaxCharisma - BaseCharisma from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Charisma < 0) or
(NEW.Willpower > (select MaxWillpower - BaseWillpower from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Willpower < 0) or
(NEW.Edge > (select MaxEdge - BaseEdge from CharacterMetatypes where CharacterMetatypes.CharacterID = NEW.CharacterID limit 1) or NEW.Edge < 0) or
(NEW.Magic > ((select TotalEssence from ViewEssenceCost where CharacterID = NEW.CharacterID limit 1) + (select InitiationGrade from CharacterInitiation where CharacterID = NEW.CharacterID limit 1)) or NEW.Magic < 0) or
(NEW.Resonance > ((select TotalEssence from ViewEssenceCost where CharacterID = NEW.CharacterID limit 1) + (select SubmersionGrade from CharacterSubmersion where CharacterID = NEW.CharacterID limit 1)) or NEW.Resonance < 0) 
begin
  select raise(abort, 'One or more attributes out of bounds');
end;

create trigger chk_essence_cap before insert on CharacterCyberware when
  ((select Magic from CharacterAttributes where CharacterAttributes.CharacterID = NEW.CharacterID limit 1) 
      > ((select TotalEssence from ViewEssenceCost where CharacterID = NEW.CharacterID limit 1) 
         + (select InitiationGrade from CharacterInitiation where CharacterID = NEW.CharacterID limit 1)))
or ((select Resonance from CharacterAttributes where CharacterAttributes.CharacterID = NEW.CharacterID limit 1) 
      > ((select TotalEssence from ViewEssenceCost where CharacterID = NEW.CharacterID limit 1) 
         + (select SubmersionGrade from CharacterSubmersion where CharacterID = NEW.CharacterID limit 1)))
begin
   select raise(abort, 'Magic or Resonance attribute exceeds Essence');
end;