create view ViewConnectionCost as select     
	CharacterID,     
    sum(Rating) + sum(Influence) as BP
from CharacterConnections
group by CharacterID;
    
create view ViewAttributeCost as select
	Characters.CharacterID,
           case when CharacterAttributes.BodyAttr < Metatype.MaxBody then ((CharacterAttributes.BodyAttr - Metatype.BaseBody) * 10)
			else (CharacterAttributes.BodyAttr - Metatype.BaseBody - 1) * 10 + 25 end + 
		case when CharacterAttributes.Agility < Metatype.MaxAgility then CharacterAttributes.Agility - Metatype.BaseAgility * 10 
			else (CharacterAttributes.Agility - Metatype.BaseAgility - 1) * 10 + 25 end +
		case when CharacterAttributes.Intuition < Metatype.MaxIntuition then CharacterAttributes.Intuition - Metatype.BaseIntuition * 10 
			else (CharacterAttributes.Intuition - Metatype.BaseIntuition - 1) * 10 + 25 end + 
		case when CharacterAttributes.Logic < Metatype.MaxLogic then CharacterAttributes.Logic - Metatype.BaseLogic * 10 
			else (CharacterAttributes.Logic - Metatype.BaseLogic - 1) * 10 + 25 end +	 
		case when CharacterAttributes.Charisma < Metatype.MaxCharisma then CharacterAttributes.Charisma - Metatype.BaseCharisma * 10 
			else (CharacterAttributes.Charisma - Metatype.BaseCharisma - 1) * 10 + 25 end +
		case when CharacterAttributes.Willpower < Metatype.MaxWillpower then CharacterAttributes.Willpower - Metatype.BaseWillpower * 10 
			else (CharacterAttributes.Willpower - Metatype.BaseWillpower - 1) * 10 + 25 end +		 
		case when CharacterAttributes.Edge < Metatype.MaxEdge then CharacterAttributes.Edge - Metatype.BaseEdge * 10 
			else (CharacterAttributes.Edge - Metatype.BaseEdge - 1) * 10 + 25 end +
		case when CharacterAttributes.Magic < 6 then CharacterAttributes.Magic * 10 
			else 75 end +  -- can't go higher than 6 on character creation
		case when CharacterAttributes.Resonance < 6 then CharacterAttributes.Resonance * 10
 			else 75 end	
	as BP
from Characters
	left outer join Metatype on Characters.CharacterMetatypeID = Metatype.MetatypeID
	left outer join CharacterAttributes on Characters.CharacterID = CharacterAttributes.CharacterID
group by Characters.CharacterID;
	
create view ViewQualityCost as select
    CharacterID,
	sum(Qualities.BPCost) as BP
from CharacterQualities
	inner join Qualities on CharacterQualities.QualityID = Qualities.QualityID
group by CharacterID;

-- missing case: skill group at rating N, single skill from that group at rating N+K.
create view ViewActiveSkillCost as select
    CharacterSkills.CharacterID,
	case when CharacterSkills.Grouped then sum(Rating * 10) 
		 else sum(Rating) * 4 
	end	
 	+
 	case when CharacterSkills.Specialisation is null then 0
 	         else 2
 	end
	 as BP
from CharacterSkills 
	inner join Skills on CharacterSkills.SkillID = Skills.SkillID 
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
	left outer join Skills on CharacterSkills.SkillID = Skills.SkillID
	left outer join CharacterAttributes on CharacterSkills.CharacterID = CharacterAttributes.CharacterID
	where not Skills.IsActive
group by CharacterSkills.CharacterID;
	
		
create view ViewTotalCost as select
    Characters.CharacterID,
      Metatype.BPCost
    + coalesce(ViewAttributeCost.BP, 0)
	+ coalesce(ViewQualityCost.BP, 0)
 	+ coalesce(ViewActiveSkillCost.BP, 0)
 	-- I do this here because it'd be clumsy in the view itself, and probably run the aggregate function twice.
 	-- If the character does not spend all their free knowledge skill points at creation, they could end up with
--  	-- a negative BP cost here, which we obviously don't want.
 	+ coalesce(case when ViewKnowledgeSkillCost.BP < 0 then 0 else ViewKnowledgeSkillCost.BP end, 0) 
	+ coalesce(ViewConnectionCost.BP, 0)
	    as BP
from Characters
    inner join Metatype on Characters.CharacterMetatypeID = Metatype.MetatypeID
    left outer join ViewConnectionCost on Characters.CharacterID = ViewConnectionCost.CharacterID
    left outer join ViewAttributeCost on Characters.CharacterID = ViewAttributeCost.CharacterID
    left outer join ViewQualityCost on Characters.CharacterID = ViewQualityCost.CharacterID
    left outer join ViewActiveSkillCost on Characters.CharacterID = ViewActiveSkillCost.CharacterID
    left outer join ViewKnowledgeSkillCost on Characters.CharacterID = ViewKnowledgeSkillCost.CharacterID;
