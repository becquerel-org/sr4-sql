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
(2, 'H. Random Mage', 'Human', 'The other other wizard Harry', 400, 0, 0, 0, 0, 0);

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
Essence,
Edge  )
values
(1, 2, 2, 2, 2, 3, 3, 3, 3, 6, 1);

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
Grouped,
Specialisation
)
values
(1, 'Pistols', 3, 0,  null),
(1, 'Automatics', 2, 0, null),
(1, 'Perception', 4, 0, 'seeing'),
(1, 'Dodge', 3, 0, null),
(1, 'Infiltration', 3, 0, null),
(1, 'Spellcasting', 4, 0, null),
(1, 'Ritual Spellcasting', 5, 0, null),
(1, 'Assensing', 4, 0, null),

(2, 'Spellcasting', 1, 0, null)
;

insert into CharacterQualities
(
CharacterID,
Quality,
Description )
values
(1, 'Magician', null),
(1, 'Addiction (Mild)', 'Alcohol'),
(1, 'Scorched (5 BP)', null)
;

update CharacterAttributes set Magic = 5 where CharacterID = 1;
update Characters set CreationComplete = 1 where CharacterID = 2;

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


