    create table Books
(Title text not null primary key);

create table Messages
(
Message text not null primary key,
Fatal boolean
);

insert into Messages (Message, Fatal) values ('One or more attributes out of bounds', 1);

create table Characters
(
CharacterID integer not null primary key,
Name text not null,
Metatype text not null,
Description text,
TotalBP integer,
TotalKarma integer,
CurrentKarma integer,
StreetCred integer,
Notoriety integer,
NativeLanguage text,
CreationComplete boolean
);

create table Metatypes
(
Name text not null primary key,
BaseBody integer not null,
BaseAgility integer not null,
BaseReaction integer not null,
BaseStrength integer not null,
BaseCharisma integer not null,
BaseIntuition integer not null,
BaseLogic integer not null,
BaseWillpower integer not null,
BaseEdge integer not null,
MaxBody integer not null,
MaxAgility integer not null,
MaxReaction integer not null,
MaxStrength integer not null,
MaxCharisma integer not null,
MaxIntuition integer not null,
MaxLogic integer not null,
MaxWillpower integer not null,
MaxEdge integer not null,
BPCost integer not null
);

create table MetatypeSpecials
(
Metatype text not null, 
Special text not null,
foreign key (Metatype) references Metatype(Name)
);

create view CharacterMetatypes as select
CharacterID,
BaseBody,
BaseAgility,
BaseReaction,
BaseStrength,
BaseCharisma,
BaseIntuition,
BaseLogic,
BaseWillpower,
BaseEdge,
MaxBody,
MaxAgility,
MaxReaction,
MaxStrength,
MaxCharisma,
MaxIntuition,
MaxLogic,
MaxWillpower,
MaxEdge
from Characters inner join Metatypes on Characters.Metatype = Metatypes.Name;
-- 
create table CharacterAttributes
(
CharacterID integer not null,
BodyAttr integer not null, -- "Body" doesn't seem to work...
Agility integer not null,
Strength integer not null,
Reaction integer not null,
Intuition integer not null,
Logic integer not null,
Charisma integer not null,
Willpower integer not null,
Edge integer not null,
Magic integer, -- needs constraint, can be NULL
Resonance integer, -- needs constraint, can be NULL
Message text,
foreign key(CharacterID) references Characters(CharacterID),
foreign key(Message) references Messages(Message)
);



create table CharacterConnections
(
CharacterID integer not null,
Name integer not null,
Description text,
Rating integer not null,
Influence integer not null,
constraint pk_cconnections primary key (CharacterID, Name, Description),
foreign key(CharacterID) references Characters(CharacterID)
);

create table Skills
(
Name text not null primary key,
SkillGroup text,
IsActive boolean not null, 
CanDefault boolean not null,
SkillAttribute text,
Description text,
foreign key(SkillGroup) references SkillGroups(Name)
);

create table SkillGroups
(
Name text not null primary key
);

create table CharacterSkills
(
CharacterID  integer not null,  
Skill text not null, 
Rating  integer not null,
Specialisation text,
constraint pk_cskills primary key (CharacterID, Skill),
foreign key(CharacterID) references Characters(CharacterID),
foreign key(Skill) references Skills(Name)
);

-- if a character has a skill group you insert it here, NOT in the Skills table
create table CharacterSkillGroups
(
CharacterID integer not null,
SkillGroup text not null,
Rating integer not null,
constraint pk_cskillgroups primary key (CharacterID, SkillGroup),
foreign key(CharacterID) references Characters(CharacterID),
foreign key(SkillGroup) references SkillGroups(Name)
);

-- this view is what you want to use for display, it displays grouped skills correctly
create view ViewCharacterSkills as select
CharacterID, Name as Skill, Rating 
 from CharacterSkillGroups
      inner join Skills on Skills.SkillGroup = CharacterSkillGroups.SkillGroup 
 union
 select CharacterID, Skill, Rating from CharacterSkills;
      


create table SkillReferences
(
Skill text not null,
Title text not null,
Page integer,
foreign key(Skill) references Skills(Name),
foreign key(Title) references Books(Title)
);

create table Qualities
(
Name text not null primary key,
BPCost integer not null, -- for negative qualities, the BP cost will be negative;
-- KarmaCost = 2 * BP cost
Description text
);

create table CharacterQualities
(
CharacterID integer not null,
Quality text not null,
Description text,
foreign key (CharacterID) references Characters(CharacterID),
foreign key (Quality) references Qualities(Name)
);



create table QualityReferences
(
Quality text not null,
Title text not null,
Page integer,
foreign key(Quality) references Qualities(Name),
foreign key(Title) references Books(Title)
);

create table CyberwareGrades
(
Grade text not null,
EssenceMultiplier number not null,
CostMultiplier number not null
);

create table Gear
(
GearType text not null,
GearName text not null,
Availability integer,
Restriction text,
NuyenCost integer not null, -- if item has a rating, choose nuyen cost per rating point
MinRating integer, 
MaxRating integer,
constraint pk_gear primary key (GearType, GearName),
constraint chk_rating_null check ((MinRating is not null and MaxRating is not null) or (MinRating is null and MaxRating is null)),
constraint chk_rating_minmax check (MinRating <= MaxRating)
);


create table CharacterGear
(
CharacterID integer not null,
GearType text not null,
GearName text not null,
Quantity integer not null,
Rating integer,
Description text,
foreign key (CharacterID) references Characters(CharacterID),
foreign key (GearType) references Gear(GearType),
foreign key (GearName) references Gear(GearName)
);

create trigger chk_gear_rating before insert on CharacterGear
when (exists (select MinRating from Gear where Gear.GearType = NEW.GearType and Gear.GearName = NEW.GearName and not (NEW.Rating between Gear.MinRating and Gear.MaxRating)))
begin
select raise(abort, 'Rating out of bounds');
end;

create table GearReferences
(
GearType integer not null,
GearName integer not null,
Title text not null,
Page integer,
constraint pk_gear primary key (GearType, GearName),
foreign key (GearType) references Gear(GearType),
foreign key (GearName) references Gear(GearName)
foreign key(Title) references Books(Title)
);

create table MeleeWeapons
(
Name text not null primary key,
Reach integer,
Damage text,
AP text
);

create table ProjectileWeapons
(
Name text not null primary key,
Damage text not null,
AP text
);

create table Firearms
(
Name text not null primary key,
Damage text not null,
AP text,
FiringMode text not null,
RC text,
Ammo text not null
);

create table Ammunition
(
Name text not null primary key,
DmgModifier text,
APModifier text,
ArmourUsed text
);

create table FirearmAccessories
(
Name text not null primary key,
Mount text not null
);

create table Grenades -- also contains rockets and missiles
(
Name text not null primary key,
Damage text,
AP text,
Blast text
);

create table Armour
(
Name text not null primary key,
Ballistic integer,
Impact integer
);

create table Commlinks
(
Model text not null primary key,
Response integer not null,
Signal integer not null
);

create table OperatingSystems
(
Name text not null primary key,
Firewall integer not null,
System integer not null
);

create table Programmes
(
Name text not null primary key,
ProgType text not null,
Skill text,
Description text,
foreign key (Skill) references Skills(Name)
);

create table Electronics
(
Name text not null primary key,
DeviceRating integer not null
);

create table SensorDevices
(
Name text not null primary key,
MinCapacity integer not null,
MaxCapacity integer  not null
);

create table SensorFunctions
(
Name text not null primary key,
SensorDeviceName text not null,
CapacityUsed integer not null,
foreign key (SensorDeviceName) references SensorDevices(Name)
);

create table Cyberware
(
Name text not null primary key,
Essence number,
CapacityRating number
);

-- insert half a billion gear tables here
create table Bioware
(
Name text not null primary key,
Essence number
);

create table CharacterCyberware
(
CharacterID integer not null,
Name text not null,
Grade text not null,
constraint pk_char_cw primary key (CharacterID, Name),
foreign key (CharacterID) references Characters(CharacterID),
foreign key (Name) references Cyberware(Name),
foreign key (Grade) references CyberwareGrades(Grade)
);

create trigger cyberware_grade after insert on CharacterGear
when NEW.GearType = 'Cyberware' 
begin
insert into CharacterCyberware
(CharacterID, Name, Grade)
values
(NEW.CharacterID, NEW.GearName, 'Standard');
end;

create table Vehicle
(
Name text not null primary key,
Handling integer not null,
Accel1 integer not null,
Accel2 integer not null,
Speed integer not null,
Pilot integer not null,
VBody integer not null,
Armour integer not null,
Sensor integer not null
);

create table VehicleAutosofts
(
Name text not null primary key,
VehicleName text,
Rating integer,
foreign key (VehicleName) references Vehicle(Name)
);



create table Spells
(
Name text not null primary key,
SpellCategory text not null,
SpellType text not null,
SpellRange text not null,
DamageType text,
Threshold integer,
Duration text not null,
DrainValue text not null,
SpellDescriptors text,
Description text
-- stuff
);



create table CharacterSpells
(
CharacterID integer not null, -- constraint for character having to have Magic? Probably not; a magician could burn out and lose their magic, too
Spell text not null,
foreign key (CharacterID) references Characters(CharacterID),
foreign key (Spell) references Spells(Name)
);

create view CharacterSpellCount as select CharacterSkills.CharacterID as CharacterID, 2 * max(CharacterSkills.Rating) as MaxSpellCount 
                                from CharacterSkills 
                                where CharacterSkills.Skill = 'Spellcasting' or CharacterSkills.Skill = 'Ritual Spellcasting'
                                group by CharacterID;

create trigger chk_spellcount before insert on CharacterSpells
when exists (select CreationComplete from Characters where CharacterID = NEW.CharacterID and coalesce(CreationComplete, 0) = 0) 
        and exists (select MaxSpellCount from CharacterSpellCount where CharacterSpellCount.CharacterID = NEW.CharacterID 
                                                                         and MaxSpellCount <= (select count(*) from CharacterSpells where CharacterID = NEW.CharacterID))
begin 
select raise(abort, 'Too many spells');
end;



create table SpellReferences
(
Spell text not null,
Title text, -- if ID is null, assume user-generated content
Page integer,
foreign key(Spell) references Spells(Name),
foreign key(Title) references Books(Title)
);

create table Powers
(
Name text not null primary key,
PCost number not null,
Leveled boolean,
Description text
);

create table CharacterPowers
(
CharacterID integer not null,
PowerName text not null,
PLevel number,
foreign key (CharacterID) references Characters(CharacterID),
foreign key (PowerName) references Powers(Name)
);

create trigger chk_plevel after insert on CharacterPowers
when exists (select PLevel, Magic from (CharacterPowers inner join Powers on Powers.Name = CharacterPowers.PowerName 
                                                inner join CharacterAttributes on CharacterPowers.CharacterID = CharacterAttributes.CharacterID)
                                  where PLevel > Magic)
begin
 delete from CharacterPowers where (CharacterID = new.CharacterID and PowerName = new.PowerName);
end;

create table CharacterInitiation
(
CharacterID integer not null,
InitiationGrade integer not null,
foreign key (CharacterID) references Characters(CharacterID)
);

create table Metamagic
(
Name text not null,
Multiple boolean not null,
Description text
);

create table CharacterMetamagic
(
CharacterID integer not null,
Metamagic text not null,
Taken integer not null,
foreign key (CharacterID) references Characters(CharacterID),
foreign key (Metamagic) references Metamagic(Name)
);

-- Yes, this is the same table. I just want to rename this for convenience when implementing the TM stuff.
create view ComplexForms as select Name, ProgType, Skill, Description from Programmes;

create table CharacterComplexForms
(
CharacterID integer not null, 
ComplexForm text not null,
Rating integer not null,
foreign key (CharacterID) references Characters(CharacterID),
foreign key (ComplexForm) references ComplexForms(Name)
);

create view CharacterCFCount as select CharacterAttributes.CharacterID as CharacterID, 2 * CharacterAttributes.Logic as MaxCFCount 
                               from CharacterAttributes group by CharacterID;
                                
create trigger chk_cfcount before insert on CharacterComplexForms
when exists (select CreationComplete from Characters where CharacterID = NEW.CharacterID and coalesce(CreationComplete, 0) = 0) 
     and exists (select MaxCFCount from CharacterCFCount where CharacterCFCount.CharacterID = NEW.CharacterID and MaxCFCount <= (select count(*) from CharacterComplexForms where CharacterID = NEW.CharacterID))
begin -- error handling
select raise(abort, 'Too many complex forms');
end;

create table ComplexFormReferences
(
ComplexFormID integer not null,
Title text,
Page integer,
foreign key(ComplexFormID) references ComplexForms(ComplexFormID),
foreign key(Title) references Books(Title)
);

create table CharacterSubmersion
(
CharacterID integer not null,
SubmersionGrade integer not null,
foreign key (CharacterID) references Characters(CharacterID)
);

-- Prerequisite?
create table Echoes
(
Name text not null primary key,
Multiple boolean not null, -- can this echo be taken multiple times?
MaxAmount integer, 
Description text
);

create table EchoPrerequisites
(
Echo text not null primary key,
Prerequisite text not null,
foreign key (Echo) references Echoes(Name),
foreign key (Prerequisite) references Echoes(Name)
);



create table CharacterEchoes
(CharacterID integer not null,
Echo text not null,
Taken integer not null, -- amount of times the echo has been taken, for echoes that can be taken multiple times
foreign key (CharacterID) references Characters(CharacterID),
foreign key (Echo) references Echoes(Name),
constraint chk_taken check (Taken > 0)
);

-- checks whether the character hasn't taken more echoes than she has submersion grades, and that she has Submerged in the first place; also checks if echo has prerequisites
create trigger chk_submersion_insert after insert on CharacterEchoes
  when (not exists (select SubmersionGrade from CharacterSubmersion where CharacterSubmersion.CharacterID = NEW.CharacterID 
                                            and SubmersionGrade >= (select SUM(Taken) from CharacterEchoes where CharacterID = NEW.CharacterID))
        or (NEW.Taken > 1 and exists (select Multiple from Echoes where Name = NEW.Name and Multiple = 0))
        or ((exists (select Prerequisite from EchoPrerequisites where Echo = NEW.Name)) and (not exists (select Echo from CharacterEchoes left outer join EchoPrerequisites on EchoPrerequisites.Echo = NEW.Name where CharacterEchoes.Echo = EchoPrerequisites.Prerequisite)))
        or (exists (select Multiple from Echoes where Name = NEW.Name and Multiple = 1 and MaxAmount < NEW.Taken)))
  begin
  delete from CharacterEchoes where CharacterID = NEW.CharacterID;
  end;

create trigger chk_submersion_update after update on CharacterEchoes
  when (not exists (select SubmersionGrade from CharacterSubmersion where CharacterSubmersion.CharacterID = NEW.CharacterID and SubmersionGrade >= (select SUM(Taken) from CharacterEchoes where CharacterID = NEW.CharacterID))
        or (NEW.Taken > 1 and exists (select Multiple from Echoes where EchoID = NEW.EchoID and Multiple = 0))
        or ((exists (select Prerequisite from EchoPrerequisites where Echo = NEW.Name)) and (not exists (select Echo from CharacterEchoes left outer join EchoPrerequisites on EchoPrerequisites.Echo = NEW.Name where CharacterEchoes.Echo = EchoPrerequisites.Prerequisite)))
        or (exists (select Multiple from Echoes where Name = NEW.Name and Multiple = 1 and MaxAmount < NEW.Taken)))
  begin
  delete from CharacterEchoes where CharacterID = NEW.CharacterID;
  end;

  
create table EchoReferences
(
Echo text not null,
Title text not null,
Page integer,
foreign key(Echo) references Echoes(Name),
foreign key(Title) references Books(Title)
);

create table Spirits
(
SpiritType text not null primary key,
BodyModifier integer not null,
AgilityModifier integer not null,
ReactionModifier integer not null,
StrengthModifier integer not null,
-- spirit initiative is (F*multiplier) + constant
InitMultiplier integer not null,
InitConstant integer not null,
IP integer not null,
AstralInitModifier integer not null,
AstralIP integer not null,
EdgeModifier integer default 1,
StandardMovement integer not null,
FastMovement integer not null,
Flying integer not null,
Description text
);

create table SpiritSkills
(
SpiritType text not null,
Skill text not null,
foreign key(SpiritType) references Spirits(SpiritType)
constraint pk_spirit_skill primary key (SpiritType, Skill)
);

create table SpiritPowers
(
SpiritType text not null,
Power text not null,
Optional integer not null,
Description text,
foreign key(SpiritType) references Spirits(SpiritType),
constraint pk_spirit_powers primary key (SpiritType, Power)
);


create table Sprites
(
SpriteType text not null primary key,
PilotModifier integer not null,
ResponseModifier integer not null,
FirewallModifier integer not null,
MatrixInitModifier integer not null,
IP integer not null,
EdgeModifier integer not null,
Description text
);

create table SpriteSkills
(
SpriteType text not null,
Skill text not null,
foreign key (SpriteType) references Sprites(SpriteType),
foreign key (Skill) references Skills(Name),
constraint pk_sprite_skills primary key (SpriteType, Skill)
);

create table SpriteComplexForms
(
SpriteType text not null,
ComplexForm text not null,
Optional boolean not null,
constraint pk_sprite_cf primary key (SpriteType, ComplexForm)
foreign key(SpriteType) references Sprites(SpriteType),
foreign key(ComplexForm) references ComplexForms(Name)
);

create table SpritePowers
(
SpriteType text not null,
SpritePower text not null,
Description text,
foreign key(SpriteType) references Sprites(SpriteType),
constraint pk_powers primary key (SpriteType, SpritePower)
);

-- designate optional complex forms for sprites
create table CharacterSprites
(
CharacterID integer not null,
SpriteID integer not null,
SpriteType text not null,
Rating integer not null,
Tasks integer not null,
Notes text,
foreign key (CharacterID) references Characters(CharacterID),
constraint pk_sprites primary key (CharacterID, SpriteID)
);

create view CharacterSpriteCount as select CharacterID, Charisma as MaxSpriteCount from CharacterAttributes;

create view CharacterSpriteTasks as select CharacterID, Rating as MaxSpriteTasks from ViewCharacterSkills where ViewCharacterSkills.Skill = 'Compiling';


create trigger chk_spritecount before insert on CharacterSprites
when exists (select CreationComplete from Characters where CharacterID = NEW.CharacterID and coalesce(CreationComplete, 0) = 0) 
     and (exists (select MaxSpriteCount from CharacterSpriteCount where CharacterSpriteCount.CharacterID = NEW.CharacterID and MaxSpriteCount < (select count(*) from CharacterSprites where CharacterID = NEW.CharacterID))
          or exists (select MaxSpriteTasks from CharacterSpriteTasks where CharacterSpriteTasks.CharacterID = NEW.CharacterID and MaxSpriteTasks < NEW.Tasks))
begin -- error handling
select raise(abort, 'Maximum amount or rating of sprites exceeded');
end;
  
-- sprites that are registered during character generation have a rating equal to the character's Resonance
create trigger sprite_rating after insert on CharacterSprites
when exists (select CreationComplete from Characters where CharacterID = NEW.CharacterID and coalesce(CreationComplete, 0) = 0) 
begin
  update CharacterSprites set Rating = (select Resonance from CharacterAttributes where CharacterAttributes.CharacterID = NEW.CharacterID )
         where CharacterID = NEW.CharacterID and SpriteID = NEW.SpriteID;
end;

create view CharacterSpiritCount as select CharacterID, Charisma as MaxSpiritCount from CharacterAttributes;
create view CharacterSpiritServices as select CharacterID, Rating as MaxSpiritServices from ViewCharacterSkills where ViewCharacterSkills.Skill = 'Summoning';

create table CharacterSpirits
(
CharacterID integer not null,
SpiritID integer not null,
SpiritType text not null,
Force integer not null,
Services integer not null,
Notes text,
foreign key (CharacterID) references Characters(CharacterID),
constraint pk_spirits primary key (CharacterID, SpiritID)

);

create trigger chk_spiritcount before insert on CharacterSpirits
   when (exists (select MaxSpiritCount from CharacterSpiritCount where CharacterID = NEW.CharacterID and MaxSpiritCount < (select count(*) from CharacterSpirits where CharacterID = NEW.CharacterID))
         or exists (select MaxSpiritServices from CharacterSpiritServices where CharacterID = NEW.CharacterID and MaxSpiritServices < NEW.Services))
begin
  select raise(abort, 'Maximum amount or services of spirits exceeded');
end;

create trigger spirit_force after insert on CharacterSpirits
begin
  update CharacterSpirits set Force = (select Magic from CharacterAttributes where CharacterAttributes.CharacterID = NEW.CharacterID)
    where CharacterID = NEW.CharacterID and SpiritID = NEW.SpiritID;
end;


create table CharacterBondedFoci
(
  CharacterID integer not null,
  Force integer not null 
);

create trigger foci_count before insert on CharacterBondedFoci
when ((select count(*) from CharacterBondedFoci) >= (select Magic from CharacterAttributes where CharacterAttributes.CharacterID = NEW.CharacterID)
     or ((select sum(Force) from CharacterBondedFoci) > 5 * (select Magic from CharacterAttributes where CharacterAttributes.CharacterID = NEW.CharacterID)))
begin
  select raise(abort, 'Maximum amount of bonded foci or total Force of bonded foci exceeded');
end;

create trigger magic_insert after insert on CharacterQualities when NEW.Quality = 'Magician' or NEW.Quality = 'Adept' or NEW.Quality = 'Mystic Adept'
 begin
 insert into CharacterInitiation
 (CharacterID, InitiationGrade)
 values
 (NEW.CharacterID, 0); 
 update CharacterAttributes
 set Magic = 1 where CharacterID = NEW.CharacterID;
 end;
 

create trigger resonance_insert after insert on CharacterQualities 
for each row when (NEW.Quality = 'Technomancer') 
begin 
 insert into CharacterSubmersion (CharacterID, SubmersionGrade) values (NEW.CharacterID, 0);
 update CharacterAttributes set Resonance = 1 where CharacterID = NEW.CharacterID;
end;

 
create trigger mag_attr_remove after delete on characterqualities
   when (OLD.Quality = 'Magician' or OLD.Quality = 'Adept' or OLD.Quality = 'Mystic Adept')
   begin
   update CharacterAttributes
 set Magic = 0 where CharacterID = NEW.CharacterID;
   delete from CharacterInitiation where CharacterInitiation.CharacterID = OLD.CharacterID;
   end;
   
create trigger res_attr_remove after delete on characterqualities
   when (OLD.Quality = 'Technomancer')
   begin
   update CharacterAttributes set Resonance = 0 where CharacterID = NEW.CharacterID;
   delete from CharacterSubmersion where CharacterSubmersion.CharacterID = OLD.CharacterID;
   end;
