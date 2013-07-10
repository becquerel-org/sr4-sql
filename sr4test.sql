insert into Characters
(
CharacterID,
Name,
Metatype,
Description,
TotalBP,
TotalKarma,
CurrentKarma,
StreetCred,
Notoriety, 
CreationComplete
)
values
(1, 'J. Random Runner', 'Elf', 'Just another random shadowrunner trying to make rent', 400, 0, 0, 0, 0, 0),
(2, 'H. Random Mage', 'Human', 'The other other wizard Harry', 400, 0, 0, 0, 0, 0),
(3, 'Fred Foobar', 'Dwarf', 'Technomancer hacker', 400, 0, 0, 0, 0, 0);

insert into CharacterAttributes
(CharacterID,
BodyAttr, -- "Body" doesn't seem to work...
Agility,
Strength,
Reaction,
Intuition,
Logic,
Charisma,
Willpower,
Edge  )
values
(1, 2, 2, 2, 2, 3, 3, 3, 3, 1),
(3, 2, 2, 2, 2, 3, 4, 2, 3, 0);

insert into CharacterConnections
(CharacterID,
Name,
Description,
Rating,
Influence  )
values
(1, 'Fred Foobar', 'J. Random Runner''s fixer', 3, 3),
(1, 'J. Random Hacker', 'Hacker connection', 4, 2);

insert into CharacterSkills
(
CharacterID ,  
Skill, 
Rating ,
Specialisation
)
values
(1, 'Pistols', 3, 'Heavy Pistols'),
(1, 'Automatics', 2,  null),
(1, 'Perception', 4,  'seeing'),
(1, 'Dodge', 3,  null),
(1, 'Infiltration', 3,  null),
(1, 'Spellcasting', 4,  null),
(1, 'Ritual Spellcasting', 5, null),
(1, 'Assensing', 4, null),

(2, 'Spellcasting', 1, null),
(3, 'Running', 2,  'long-distance'),
(1, 'Criminal Organizations', 3,  'Yakuza')
;

insert into CharacterSkillGroups
(CharacterID, SkillGroup, Rating)
values
(2, 'Influence', 3),
(3, 'Tasking', 3);

insert into CharacterQualities
(
CharacterID,
Quality,
Description )
values
(1, 'Magician', null),
(1, 'Addiction (Mild)', 'Alcohol'),
(1, 'Scorched (5 BP)', null),
(3, 'Technomancer', null)
;

update CharacterAttributes set Magic = 5 where CharacterID = 1;
update Characters set CreationComplete = 1 where CharacterID = 2;
update CharacterAttributes set Resonance = 4 where CharacterID = 3;
insert into CharacterSpells
(
CharacterID, -- constraint for character having to have Magic? Probably not; a magician could burn out and lose their magic, too
Spell  
)
values
(1, 'Stunbolt'),
(1, 'Clairvoyance'),
(1, 'Heal'),
(1, 'Combat Sense'),
(1, 'Mindlink'),
(1, 'Mind Probe'),
(1, 'Detox'),
(1, 'Hibernate'),
(1, 'Antidote'),
(1, 'Oxygenate'),

(2, 'Heal'),
(2, 'Clairvoyance'),
(2, 'Mindlink');


insert into CharacterSprites
(CharacterID, SpriteID, SpriteType, Rating, Tasks)
values
(3, 1, 'Code', 5, 2),
--(3, 2, 'Code', 5, 1),
(3, 3, 'Data', 5, 1);


insert into CharacterCyberware
(CharacterID, Name, Grade)
values
(2, 'Control Rig', 'Standard'),
(2, 'Bone Lacing (Aluminum)', 'Alphaware'),
(2, 'Dermal Plating (Rating 3)', 'Betaware'),
(2, 'Muscle Replacement (Rating 3)', 'Deltaware');


insert into CharacterGear
(CharacterID, GearType, GearName, Quantity)
values
(1, 'MeleeWeapon', 'Katana', 1), -- 1000
(1, 'Firearms', 'Ares Predator IV', 2), --700
(1, 'Ammunition', 'Gel Rounds', 100), --3000
(1, 'Armour', 'Feedback Clothing', 1); -- 500