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
Name TEXT NOT NULL PRIMARY KEY,
SkillGroup TEXT,
IsActive BOOLEAN NOT NULL, 
CanDefault BOOLEAN NOT NULL,
SkillAttribute TEXT,
Description TEXT,
Multiple BOOLEAN, -- Can this skill be taken multiple times? e.g. Exotic Weapons
FOREIGN KEY(SkillGroupID) REFERENCES SkillGroups(SkillGroupID)
);

CREATE TABLE SkillGroups
(
Name TEXT NOT NULL PRIMARY KEY
);

CREATE TABLE CharacterSkills
(
CharacterID  INTEGER NOT NULL,
SkillName TEXT NOT NULL, 
Rating  INTEGER NOT NULL,
Grouped BOOLEAN NOT NULL,
Specialisation TEXT,
FOREIGN KEY(CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY(SkillID) REFERENCES Skills(SkillID)
);

CREATE TRIGGER multiple_skills INSTEAD OF INSERT ON CharacterSkills
  WHEN EXISTS (SELECT Multiple FROM Skills WHERE Name = NEW.SkillName AND Multiple = 1)
  BEGIN
  INSERT INTO CharacterSkills (CharacterID, SkillName, Rating, Grouped, Specialisation, Description)
  VALUES
  (NEW.CharacterID, NEW.SkillName + ' (' + NEW.Description + ')', NEW.Rating, NEW.Grouped, NEW.Specialisation);
  END;

CREATE TABLE SkillReferences
(
Skill TEXT NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(SkillID) REFERENCES Skills(SkillID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

CREATE TABLE Qualities
(
Name TEXT NOT NULL PRIMARY KEY,
BPCost INTEGER NOT NULL, -- for negative qualities, the BP cost will be negative;
-- KarmaCost = 2 * BP cost
Description TEXT
);

CREATE TABLE CharacterQualities
(
CharacterID INTEGER NOT NULL,
Quality TEXT NOT NULL,
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
GearType TEXT NOT NULL,
GearName TEXT NOT NULL,
Availability INTEGER,
Restriction TEXT,
NuyenCost INTEGER NOT NULL,
MinRating INTEGER NOT NULL, -- if item has no rating, choose (0, 0)
MaxRating INTEGER NOT NULL,
CONSTRAINT pk_gear PRIMARY KEY (GearType, GearName)
);


CREATE TABLE CharacterGear
(
CharacterID INTEGER NOT NULL,
GearType INTEGER NOT NULL,
GearName INTEGER NOT NULL
Quantity INTEGER NOT NULL,
Rating INTEGER,
Description TEXT,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (GearType) REFERENCES Gear(GearType),
FOREIGN KEY (GearName) REFERENCES Gear(GearName)
);

CREATE TABLE GearReferences
(
GearID INTEGER NOT NULL,
BookID INTEGER NOT NULL,
Page INTEGER,
FOREIGN KEY(GearID) REFERENCES Gear(GearID),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);

CREATE TABLE MeleeWeapons
(
Name TEXT PRIMARY KEY,
Reach INTEGER,
Damage TEXT,
AP TEXT
);

CREATE TABLE ProjectileWeapons
(
Name TEXT PRIMARY KEY,
Damage TEXT,
AP TEXT
);

CREATE TABLE Firearms
(
Name TEXT PRIMARY KEY,
Damage TEXT,
AP TEXT,
FiringMode TEXT,
RC TEXT,
Ammo TEXT
);

CREATE TABLE Ammunition
(
Name TEXT PRIMARY KEY,
DmgModifier TEXT,
APModifier TEXT,
ArmourUsed TEXT
);

CREATE TABLE FirearmAccessories
(
Name TEXT PRIMARY KEY,
Mount TEXT
);

CREATE TABLE Grenades -- also contains rockets and missiles
(
Name TEXT PRIMARY KEY,
Damage TEXT,
AP TEXT,
Blast TEXT
);

CREATE TABLE Armour
(
Name TEXT PRIMARY KEY,
Ballistic INTEGER,
Impact INTEGER
);

CREATE TABLE Commlinks
(
Model TEXT PRIMARY KEY,
Response INTEGER NOT NULL,
Signal INTEGER NOT NULL
);

CREATE TABLE OperatingSystems
(
Name TEXT PRIMARY KEY,
Firewall INTEGER NOT NULL,
System INTEGER NOT NULL
);

CREATE TABLE Electronics
(
Name TEXT PRIMARY KEY,
DeviceRating INTEGER
);
-- insert half a billion gear tables here

CREATE TABLE Spells
(
Name TEXT NOT NULL PRIMARY KEY,
Category TEXT NOT NULL,
SpellType TEXT NOT NULL,
SpellRange TEXT NOT NULL,
Threshold INTEGER,
Duration TEXT NOT NULL,
DrainValue TEXT NOT NULL,
SpellDescriptors TEXT,
Description TEXT
-- stuff
);

CREATE TABLE CharacterSpells
(
CharacterID INTEGER NOT NULL, -- constraint for character having to have Magic? Probably not; a magician could burn out and lose their magic, too
Spell TEXT NOT NULL,
FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
FOREIGN KEY (SpellID) REFERENCES Spells(SpellID)
);

CREATE TABLE SpellReferences
(
Spell TEXT NOT NULL,
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
Name TEXT NOT NULL PRIMARY KEY,
Description TEXT
);

CREATE TABLE CharacterComplexForms
(
CharacterID INTEGER NOT NULL, -- constraint: character must be a TM? Is that necessary here? Probably not.
ComplexForm TEXT NOT NULL,
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
