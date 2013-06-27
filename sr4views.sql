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

create view ViewActiveSkillCost as select
    CharacterSkills.CharacterID,
	case when CharacterSkills.Grouped then sum(Rating * 10) 
		 else sum(Rating) * 4 
	end	
	 as BP
from CharacterSkills 
	inner join Skills on CharacterSkills.Skill = Skills.Name
	where Skills.IsActive
group by CharacterID;

create view ViewKnowledgeSkillCost as select
	CharacterSkills.CharacterID,
 	(sum(Rating) * 2 
 	  + 
 	 case when CharacterSkills.Specialisation is null then 0 else 1 end) 
 	 - (6 * (CharacterAttributes.Logic + CharacterAttributes.Intuition)) 
	 as BP
from CharacterSkills
	inner join Skills on CharacterSkills.Skill = Skills.Name
	inner join CharacterAttributes on CharacterSkills.CharacterID = CharacterAttributes.CharacterID
	where not Skills.IsActive
group by CharacterSkills.CharacterID;

	
		
create view ViewTotalCost as select
    Characters.CharacterID,
      Metatypes.BPCost
    + coalesce(ViewAttributeCost.BP, 0)
	+ coalesce(ViewQualityCost.BP, 0)
 	+ coalesce(ViewActiveSkillCost.BP, 0)
 	-- I do this here because it'd be clumsy in the view itself, and probably run the aggregate function twice.
 	-- If the character does not spend all their free knowledge skill points at creation, they could end up with
--  	-- a negative BP cost here, which we obviously don't want.
 	+ coalesce(case when ViewKnowledgeSkillCost.BP < 0 then 0 else ViewKnowledgeSkillCost.BP end, 0) 
	+ coalesce(ViewConnectionCost.BP, 0)
	+ 3 * (select count(*) from CharacterSpells)
	    as BP
from Characters
    left outer join Metatypes on Characters.Metatype = Metatypes.Name
    left outer join ViewConnectionCost on Characters.CharacterID = ViewConnectionCost.CharacterID
    left outer join ViewAttributeCost on Characters.CharacterID = ViewAttributeCost.CharacterID
    left outer join ViewQualityCost on Characters.CharacterID = ViewQualityCost.CharacterID
    left outer join ViewActiveSkillCost on Characters.CharacterID = ViewActiveSkillCost.CharacterID
    left outer join ViewKnowledgeSkillCost on Characters.CharacterID = ViewKnowledgeSkillCost.CharacterID
    left outer join CharacterSpells on Characters.CharacterID = CharacterSpells.CharacterID
    left outer join CharacterComplexForms on Characters.CharacterID = CharacterComplexForms.CharacterID;

    
create view ViewGearNuyenCost as select
   Characters.CharacterID,
   sum(Gear.NuyenCost * coalesce(CharacterGear.Rating, 1) * CharacterGear.Quantity)   
from CharacterGear
  left outer join Characters on Characters.CharacterID = CharacterGear.CharacterID
  left outer join Gear on (CharacterGear.GearType = Gear.GearType and CharacterGear.GearName = Gear.GearName)
  group by Characters.CharacterID;
  
