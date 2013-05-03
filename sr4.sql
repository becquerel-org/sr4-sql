CREATE TABLE Book
(BookID INTEGER NOT NULL PRIMARY KEY,
Title TEXT);

CREATE TABLE Characters
(
CharacterID INTEGER NOT NULL PRIMARY KEY,
CharacterName TEXT NOT NULL,
CharacterMetatypeID INTEGER NOT NULL,
CharacterDescription TEXT,
CharacterTotalBP INTEGER,
CharacterTotalKarma INTEGER,
CharacterCurrentKarma INTEGER,
CharacterStreetCred INTEGER,
CharacterNotoriety INTEGER
);

CREATE TABLE Metatype
(
MetatypeID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL,
MetavariantID INTEGER,
BaseStrength INTEGER NOT NULL,
BaseBody INTEGER NOT NULL,
BaseAgility INTEGER NOT NULL,
BaseIntuition INTEGER NOT NULL,
BaseLogic INTEGER NOT NULL,
BaseCharisma INTEGER NOT NULL,
BaseWillpower INTEGER NOT NULL,
BaseEdge INTEGER NOT NULL,
MaxStrength INTEGER NOT NULL, -- unaugmented
MaxBody INTEGER NOT NULL,
MaxAgility INTEGER NOT NULL,
MaxIntuition INTEGER NOT NULL,
MaxLogic INTEGER NOT NULL,
MaxCharisma INTEGER NOT NULL,
MaxWillpower INTEGER NOT NULL,
MaxEdge INTEGER NOT NULL,
BPCost INTEGER NOT NULL
);

CREATE TABLE CharacterAttributes
(
CharacterID INTEGER NOT NULL,
BodyAttr INTEGER NOT NULL, -- "Body" doesn't seem to work...
Agility INTEGER NOT NULL,
Strength INTEGER NOT NULL,
Intuition INTEGER NOT NULL,
Logic INTEGER NOT NULL,
Charisma INTEGER NOT NULL,
Willpower INTEGER NOT NULL,
Essence  INTEGER NOT NULL,
Edge INTEGER NOT NULL,
Magic INTEGER, -- needs constraint, can be NULL
Resonance INTEGER, -- needs constraint, can be NULL
FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID)
);


CREATE TABLE CharacterConnections
(
CharacterID INTEGER NOT NULL,
Name INTEGER NOT NULL,
Description TEXT,
Rating INTEGER NOT NULL,
Influence INTEGER NOT NULL,
FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID)
);

CREATE TABLE Skills
(
SkillID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL,
SkillGroupID INTEGER,
IsActive BOOLEAN NOT NULL, 
CanDefault BOOLEAN NOT NULL,
SkillAttribute TEXT,
Description TEXT,
FOREIGN KEY(SkillGroupID) REFERENCES SkillGroups(SkillGroupID)
);

CREATE TABLE SkillGroups
(
SkillGroupID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL
);

CREATE TABLE CharacterSkills
(
CharacterID  INTEGER NOT NULL,
SkillID  INTEGER NOT NULL, 
Rating  INTEGER NOT NULL,
Grouped BOOLEAN NOT NULL,
Specialisation TEXT,
Description TEXT, 
FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY(SkillID) REFERENCES Skills(SkillID)
);

CREATE TABLE SkillReferences
(
SkillID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(SkillID) REFERENCES Skills(SkillID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

CREATE TABLE Qualities
(
QualityID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL,
BPCost INTEGER NOT NULL, -- for negative qualities, the BP cost will be negative
KarmaCost INTEGER NOT NULL, 
Description TEXT
);

CREATE TABLE CharacterQualities
(
CharacterID INTEGER NOT NULL,
QualityID INTEGER NOT NULL,
Description TEXT,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (QualityID) REFERENCES Qualities(QualityID)
);



CREATE TABLE QualityReferences
(
QualityID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(QualityID) REFERENCES Qualities(QualityID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

CREATE TABLE Gear
(
GearID INTEGER NOT NULL PRIMARY KEY,
GearType TEXT NOT NULL,
SpecificGearID INTEGER NOT NULL -- constraint
);

CREATE TABLE CharacterGear
(
CharacterID INTEGER NOT NULL,
GearID INTEGER NOT NULL,
Quantity INTEGER NOT NULL,
Rating INTEGER,
Description TEXT,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (GearID) REFERENCES Gear(GearID)
);

CREATE TABLE GearReferences
(
GearID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(GearID) REFERENCES Gear(GearID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

-- insert half a billion gear tables here

CREATE TABLE Spells
(
SpellID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL,
Category TEXT NOT NULL,
SpellType TEXT NOT NULL,
SpellRange TEXT NOT NULL,
Threshold INTEGER,
Duration TEXT NOT NULL,
DrainValue TEXT NOT NULL,
Description TEXT
-- stuff
);

CREATE TABLE CharacterSpells
(
CharacterID INTEGER NOT NULL, -- constraint for character having to have Magic? Probably not; a magician could burn out and lose their magic, too
SpellID INTEGER NOT NULL,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (SpellID) REFERENCES Spells(SpellID)
);

CREATE TABLE SpellReferences
(
SpellID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(SpellID) REFERENCES Spells(SpellID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

CREATE TABLE CharacterInitiation
(
CharacterID INTEGER NOT NULL,
InitiationGrade INTEGER NOT NULL,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID)
);

CREATE TABLE Metamagic
(
MetamagicID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL
);

-- CREATE TABLE CharacterMetamagic
-- (
-- CharacterID INTEGER NOT NULL,


CREATE TABLE ComplexForms
(
ComplexFormID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL,
Description TEXT
);

CREATE TABLE CharacterComplexForms
(
CharacterID INTEGER NOT NULL, -- constraint: character must be a TM? Is that necessary here? Probably not.
ComplexFormID INTEGER NOT NULL,
Rating INTEGER NOT NULL,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (ComplexFormID) REFERENCES ComplexForms(ComplexFormID)
);


CREATE TABLE ComplexFormReferences
(
ComplexFormID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(ComplexFormID) REFERENCES ComplexForms(ComplexFormID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

CREATE TABLE CharacterSubmersion
(
CharacterID INTEGER NOT NULL,
SubmersionGrade INTEGER NOT NULL,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID)
);

-- Prerequisite?
CREATE TABLE Echoes
(
EchoID INTEGER NOT NULL PRIMARY KEY,
Name TEXT NOT NULL,
Multiple BOOLEAN NOT NULL, -- can this echo be taken multiple times?
Description TEXT
);

CREATE TABLE CharacterEchoes
(CharacterID INTEGER NOT NULL,
EchoID INTEGER NOT NULL,
Taken INTEGER NOT NULL, -- amount of times the echo has been taken, for echoes that can be taken multiple times
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (EchoID) REFERENCES Echoes(EchoID),
CONSTRAINT chk_taken CHECK (Taken > 0)
);

-- checks whether the character hasn't taken more echoes than she has submersion grades, and that she has Submerged in the first place.
CREATE TRIGGER chk_submersion_insert AFTER INSERT ON CharacterEchoes
  WHEN (NOT EXISTS (SELECT SubmersionGrade FROM CharacterSubmersion WHERE CharacterSubmersion.CharacterID = NEW.CharacterID AND SubmersionGrade >= (SELECT SUM(Taken) FROM CharacterEchoes WHERE CharacterID = NEW.CharacterID))
        OR (NEW.Taken > 1 AND EXISTS (SELECT Multiple FROM Echoes WHERE EchoID = NEW.EchoID AND Multiple = 0)))      
  BEGIN
  DELETE FROM CharacterEchoes WHERE CharacterID = NEW.CharacterID;
  END;

CREATE TRIGGER chk_submersion_update AFTER UPDATE ON CharacterEchoes
  WHEN (NOT EXISTS (SELECT SubmersionGrade FROM CharacterSubmersion WHERE CharacterSubmersion.CharacterID = NEW.CharacterID AND SubmersionGrade >= (SELECT SUM(Taken) FROM CharacterEchoes WHERE CharacterID = NEW.CharacterID))
        OR (NEW.Taken > 1 AND EXISTS (SELECT Multiple FROM Echoes WHERE EchoID = NEW.EchoID AND Multiple = 0)))
  BEGIN
  DELETE FROM CharacterEchoes WHERE CharacterID = NEW.CharacterID;
  END;

  
CREATE TABLE EchoReferences
(
EchoID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(EchoID) REFERENCES Echoes(EchoID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);


CREATE TRIGGER ini_grade_insert AFTER INSERT ON CharacterQualities
  WHEN EXISTS (SELECT Description from Qualities where QualityID = NEW.QualityID
                                                   and (Qualities.Name = 'Magician' or Qualities.Name = 'Adept' or Qualities.Name = 'Mystic Adept'))
 BEGIN
 INSERT INTO CharacterInitiation
 (CharacterID, InitiationGrade)
 VALUES
 (NEW.CharacterID, 0);
 END;
 

CREATE TRIGGER subm_grade_insert AFTER INSERT ON CharacterQualities
WHEN EXISTS (SELECT Description from Qualities where QualityID = NEW.QualityID 
                                                and (Qualities.Name = 'Technomancer'))
BEGIN
INSERT INTO CharacterSubmersion
(CharacterID, SubmersionGrade)
VALUES
(NEW.CharacterID, 0);
END;

CREATE TRIGGER echoes_insert AFTER INSERT ON CharacterEchoes
WHEN NEW.Taken IS NULL
BEGIN
UPDATE CharacterEchoes
SET Taken = 1 WHERE CharacterID = NEW.CharacterID AND EchoID = NEW.EchoID;
END;

-- Missing constraint: 
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
			else 75 end +-- can't go higher than 6 on character creation
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
insert into Metatype
    (MetatypeID, Name, MetavariantID, BaseStrength, BaseBody, BaseAgility, BaseIntuition, BaseLogic, BaseCharisma, BaseWillpower, BaseEdge, MaxStrength, MaxBody, MaxAgility, MaxIntuition, MaxLogic, MaxCharisma, MaxWillpower, MaxEdge, BPCost)
values
    (1, 'Homo sapiens sapiens', NULL, 1, 1, 1, 1, 1, 1, 1, 2, 6, 6, 6, 6, 6, 6, 6, 7, 0),
    (2, 'Homo sapiens nobilis', NULL, 1, 1, 2, 1, 1, 3, 1, 1, 6, 6, 7, 6, 6, 8, 6, 6, 40)
    ;

    
        
insert into SkillGroups
    (SkillGroupID, Name)
values
    (1, 'Athletics'),
    (2, 'Biotech'),
    (3, 'Close Combat'),
    (4, 'Conjuring'),
    (5, 'Cracking'),
    (6, 'Electronics'),
    (7, 'Firearms'),
    (8, 'Influence'),
    (9, 'Mechanic'),
    (10, 'Outdoors'),
    (11, 'Sorcery'),
    (12, 'Stealth'),
    (13, 'Tasking')
    ;
    
-- insert into Skills
--     (SkillID, Name, SkillGroupID, IsActive, CanDefault, SkillAttribute, Description)
--     values
--     (1, 'Archery', null, 1, 1, 'Agility', 'Use of muscle-powered projectile weapons'),
--     (2, 'Automatics', 7, 1, 1, 'Agility', 'Use of personal firearms capable of autofire, larger than a pistol, but typically with a shorter barrel than a longarm'),
--     (3, 'Blades', 3, 1, 1, 'Agility', 'Use of hand-held melee weapons with a sharpened edge or point'),
--     (4, 'Clubs', 3, 1, 1, 'Agility', 'Use of hand-held melee weapons that have no edge or blade'),
--     (5, 'Dodge', null, 1, 1, 'Reaction', 'Ability to move out of the way of a perceived attack or other incoming threat'),
--     (6, 'Exotic Melee Weapon', null, 1, 1, 'Agility', 'Must be taken separately for each different weapon you wish to be able to use'),
--     (7, 'Exotic Ranged Weapon', null, 1, 1, 'Agility', 'Must be taken separately for each different weapon you wish to be able to use'),
--     (8, 'Heavy Weapons', null, 1, 1, 'Agility', 'Use of ranged projectile and launch weapons larger than an assault rifle'),
--     (9, 'Longarms', 7, 1, 1, 'Agility', 'Use of all personal firearms with extended barrels'),
--     (10, 'Pistols', 7, 1, 1, 'Agility', 'Use of all types of hand-held firearms'),
--     (11, 'Throwing Weapons', null, 1, 1, 'Agility', 'Use of any item thrown by the user'),
--     (12, 'Unarmed Combat', insert into Characters
    (CharacterID, CharacterName, CharacterMetatypeID, CharacterDescription, CharacterTotalBP, CharacterTotalKarma, CharacterCurrentKarma)
values
    (1, 'John Doe', 1, null, 400, 750, 1),
    (2, 'Jane Doe', 2, null, 400, 750, 1),
    (3, 'Janice Doe', 1, null, 400, 750, 1),
    (4, 'Jolly Doe', 2, null, 400, 750, 1)
;

insert into CharacterConnections
    (CharacterID, Name, Description, Rating, Influence)
values
    (1, 'Cameron', null, 4, 5),
    (1, 'Alice', null, 1, 3),
    (2, 'Bob', null, 3, 2)
;

insert into CharacterAttributes
    (CharacterID, BodyAttr, Agility, Strength, Intuition, Logic, Charisma, Willpower, Essence, Edge)
values
    (1, 2, 3, 4, 3, 3, 5, 4, 2, 2),
	(3, 2, 3, 4, 3, 3, 6, 4, 2, 2);