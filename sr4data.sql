insert into Metatype
    (MetatypeID, Name, MetavariantID, BaseStrength, BaseBody, BaseAgility, BaseIntuition, BaseLogic, BaseCharisma, BaseWillpower, BaseEdge, MaxStrength, MaxBody, MaxAgility, MaxIntuition, MaxLogic, MaxCharisma, MaxWillpower, MaxEdge, BPCost)
values
    (1, 'Homo sapiens sapiens', NULL, 1, 1, 1, 1, 1, 1, 1, 2, 6, 6, 6, 6, 6, 6, 6, 7, 0),
    (2, 'Homo sapiens nobilis', NULL, 1, 1, 2, 1, 1, 3, 1, 1, 6, 6, 7, 6, 6, 8, 6, 6, 40)
    ;

    
        
insert into SkillGroups
    (Name)
values
    ('Athletics'),
    ('Biotech'),
    ('Close Combat'),
    ('Conjuring'),
    ('Cracking'),
    ('Electronics'),
    ('Firearms'),
    ('Influence'),
    ('Mechanic'),
    ('Outdoors'),
    ('Sorcery'),
    ('Stealth'),
    ('Tasking')
    ;
    
insert into Skills
    (Name, SkillGroup, IsActive, CanDefault, SkillAttribute, Description, Multiple)
    values
    --  Combat 
    ('Archery', null, 1, 1, 'Agility', 'Use of muscle-powered projectile weapons', null),
    ('Automatics', 7, 1, 1, 'Agility', 'Use of personal firearms capable of autofire, larger than a pistol, but typically with a shorter barrel than a longarm', null),
    ('Blades', 3, 1, 1, 'Agility', 'Use of hand-held melee weapons with a sharpened edge or point', null),
    ('Clubs', 3, 1, 1, 'Agility', 'Use of hand-held melee weapons that have no edge or blade', null),
    ('Dodge', null, 1, 1, 'Reaction', 'Ability to move out of the way of a perceived attack or other incoming threat', null),
    ('Exotic Melee Weapon', null, 1, 1, 'Agility', 'Must be taken separately for each different weapon you wish to be able to use', 1), -- Front end should take care of that
    ('Exotic Ranged Weapon', null, 1, 1, 'Agility', 'Must be taken separately for each different weapon you wish to be able to use', 1),
    ('Heavy Weapons', null, 1, 1, 'Agility', 'Use of ranged projectile and launch weapons larger than an assault rifle', null),
    ('Longarms', 7, 1, 1, 'Agility', 'Use of all personal firearms with extended barrels', null),
    ('Pistols', 7, 1, 1, 'Agility', 'Use of all types of hand-held firearms', null),
    ('Throwing Weapons', null, 1, 1, 'Agility', 'Use of any item thrown by the user', null),
    ('Unarmed Combat', null, 1, 1, 'Agility', 'Use of combat techniques based solely on the use of own body parts', null),
    --  Magical Active
    ('Arcana', null, 1, 0, 'Logic', 'Practical application of magical theory', null),
    ('Assensing', null, 1, 0, 'Intuition', 'Learning information from auras, astral forms and astral signatures', null), -- constraint: capable of astral perception?
    ('Astral Combat', null, 1, 0, 'Willpower', 'Fight while in astral space', null), -- capable of astral perception
    ('Banishing', 'Conjuring', 1, 0, 'Magic', 'Disrupt spirits, removing them from the physical and astral planes', null),
    ('Binding', 'Conjuring', 1, 0, 'Magic', 'Ask/demand long-term services from a spirit the magician has already summoned', null),
    ('Counterspelling', 'Sorcery', 1, 0, 'Magic', 'Remove existing sustained spells, or defend against spells cast at them or others', null),
    ('Enchanting', null, 1, 0, 'Magic', 'Techniques to create magical foci, spirit vessels, and to evaluate magical goods', null), -- constraint: Adept/Magician/Mystic Adept, Magic attribute >= 1,
    ('Ritual Spellcasting', 'Sorcery', 1, 0, 'Magic', 'Cast spells in a ritual fashion', null),
    ('Spellcasting', 'Sorcery', 1, 0, 'Magic', 'Cast spells', null),
    ('Summoning', 'Conjuring', 1, 0, 'Magic', 'Summon spirits and determine how many services they owe', null),
    -- Physical Active,
    ('Climbing', 'Athletics', 1, 1, 'Strength', 'Ascend vertical obstacles or walls', null),
    ('Disguise', 'Stealth', 1, 1, 'Intuition', 'Take on a false appearance', null),
    ('Diving', null, 1, 1, 'Body', 'All forms of underwater diving', null),
    ('Escape Artist', null, 1, 1, 'Agility', 'Slip out of bonds or shackles without using brute force', null),
    ('Gymnastics', 'Athletics', 1, 1, 'Agility', 'Acrobatics feats, balance, jumping, vaulting and tumbling', null),
    ('Infiltration', 'Stealth', 1, 1, 'Agility', 'Sneak around undetected by either other characters or security sensors', null),
    ('Navigation', 'Outdoors', 1, 1, 'Intuition', 'Determine directions, read maps, plot a course, stick to it without getting lost', null),
    ('Palming', 'Stealth', 1, 1, 'Agility', 'Conceal small objects or remove them from others without being noticed', null),
    ('Parachuting', null, 1, 1, 'Body', 'Exit a high area with a parachute and stop your quick descent', null),
    ('Perception', null, 1, 1, 'Intuition', 'Determine what you notice about your surroundings that is abnormal or strange', null),
    ('Running', 'Athletics', 1, 1, 'Strength', 'Increase the distance you can run, determine how well you can pace yourself', null),
    ('Shadowing', 'Stealth', 1, 1, 'Intuition', 'Follow someone else discreetly without being noticed; ensure you are not followed the same way', null),
    ('Survival', 'Outdoors', 1, 1, 'Willpower', 'Proficiency in surviving outdoors for an extended period of time', null),
    ('Swimming', 'Athletics', 1, 1, 'Strength', 'Increase the distance you can swim; determines how much experience you have had with water', null),
    ('Tracking', 'Outdoors', 1, 1, 'Intuition', 'Track metahumans or critters in the wild', null),
    -- Resonance Active
    ('Compiling', 'Tasking', 1, 0, 'Resonance', 'Compile sprites and determine how many tasks they owe', null),
    ('Decompiling', 'Tasking', 1, 0, 'Resonance', 'Decompile sprites', null),
    ('Registering', 'Tasking', 1, 0, 'Resonance', 'Register sprites for long-term service', null),
    -- Social Active
    ('Con', 'Influence', 1, 1, 'Charisma', 'Misrepresent the truth in some way, and get the others to believe you', null),
    ('Etiquette', 'Influence', 1, 1, 'Charisma', 'Function within a specific subculture without appearing out of place', null),
    ('Instruction', null, 1, 1, 'Charisma', 'Teach something efficiently to another character', null),
    ('Intimidation', null, 1, 1, 'Charisma', 'Make people do what they normally might not, out of fear inspired by your appearance or behaviour', null),
    ('Leadership', 'Influence', 1, 1, 'Charisma', 'Get others to do your bidding through example and authority', null),
    ('Negotiation', 'Influence', 1, 1, 'Charisma', 'Bargaining tactics used when you deal with another character and seek to come out ahead', null),
    -- Technical Active
    ('Aeronautics Mechanic', 'Mechanic', 1, 0, 'Logic', 'Repair and maintain aircraft', null),
    ('Artisan', null, 1, 1, 'Intuition', 'Creative skills', null),
    ('Automotive Mechanic', 'Mechanic', 1, 0, 'Logic', 'Repair and maintain ground craft', null),
    ('Chemistry', null, 1, 0, 'Logic', 'Use and understanding of chemistry; proper laboratory procedure, ability to read chemical formulae', null),
    ('Computer', 'Electronics', 1, 1, 'Logic', 'Use and understanding of computers and electronic devices', null),
    ('Cybercombat', 'Cracking', 1, 1, 'Logic', 'Attack other icons in the Matrix, utilise attack programmes and system tricks', null),
    ('Cybertechnology', 'Biotech', 1, 0, 'Logic', 'Create and care for cybernetics and bioware', null),
    ('Data Search', 'Electronics', 1, 1, 'Logic', 'Use search engines, databases and other tools to track down information', null),
    ('Demolitions', null, 1, 1, 'Logic', 'Preparation, measuring and setting of chemical explosives', null),
    ('Electronic Warfare', 'Cracking', 1, 0, 'Logic', 'Disrupt communications in a variety of ways; encode and decode communications', null),
    ('First Aid', 'Biotech', 1, 1, 'Logic', 'Basic medicine in a hands-on sense', null),
    ('Forgery', null, 1, 1, 'Agility', 'Make a copy of a document or other item', null),
    ('Hacking', 'Cracking', 1, 1, 'Logic', 'Exploit and subvert the programming of computers and electronics', null), 
    ('Hardware', 'Electronics', 1, 0, 'Logic', 'Creation, repair and technical manipulation of computers and electronic devices', null),
    ('Industrial Mechanic', 'Mechanic', 1, 0, 'Logic', 'Maintain and repair mechanical devices used in various industries', null), 
    ('Locksmith', null, 1, 1, 'Agility', 'Manipulate, open and repair mechanical locks', null), 
    ('Medicine', 'Biotech', 1, 0, 'Logic', 'Proper treatment of disease and illness as well as wounds, beyond what First Aid can do', null), 
    ('Nautical Mechanic', 'Mechanic', 1, 0, 'Logic', 'Repair and maintain watercraft', null), 
    ('Software', 'Electronics', 1, 0, 'Logic', 'Write utilities for use in the Matrix', null), 
    -- Vehicle Active
    ('Gunnery', null, 1, 1, 'Agility', 'Use vehicle-mounted weapons', null), 
    ('Pilot Aerospace', null, 1, 0, 'Reaction', 'Control parabolic aircraft, suborbital aircraft, and anything piloted outside the atmosphere', null), 
    ('Pilot Aircraft', null, 1, 0, 'Reaction', 'Use aircraft piloted within the atmosphere', null), 
    ('Pilot Anthroform', null, 1, 0, 'Reaction', 'Operate vehicle that walks on legs', null), 
    ('Pilot Exotic Vehicle', null, 1, 0, 'Reaction', 'Must be taken separately for each exotic vehicle you wish to pilot', 1),
    ('Pilot Ground Craft', null, 1, 0, 'Reaction', 'Control ground vehicles without legs', null),
    ('Pilot Watercraft', null, 1, 0, 'Reaction', 'Control water vehicles', null),
    -- Language
    ('Language', null, 0, 0, 'Intuition', 'Must be taken separately for each language desired', 1), 
    -- Knowledge
    ('Knowledge', null, 0, 0, 'Logic', 'Must be taken separately for each knowledge skill desired', 1)
    ;
    

INSERT INTO Qualities
  (Name, BPCost, Description)
VALUES
 -- Core Book
 -- Positive
  ('Adept', 5, 'Character is an adept, starts with Magic attribute of 1'),
  ('Ambidextrous', 5, 'Character can handle objects equally well with both hands')
  ('Animal Empathy', 10, '+2 modifier for all tests involving influence or control of an animal'),
  ('Aptitude', 10, 'May improve one Active skill one point above its natural maximum to a 7'),
  ('Astral Chameleon', 5, 'Astral signatures last half as long, -2 to others assensing the signature'), -- only for Magic users
  ('Blandness', 10, 'Character blends into any crowd easily'),
  ('Codeslinger', 10, 'Character is particularly adept to a particular Matrix action'), 
  ('Double Jointed', 5, 'Character has unusually flexible joints'), 
  ('Erased (5 BP)', 5, 'Criminal SINs and unwanted data abouut the character disappear within a week'),
  ('Erased (10 BP)', 10, 'Any personal information on the Matrix the character wishes disappears after 24 hours'),
  ('Exceptional Attribute', 20, 'The character may possess a natural Physical or Mental attribute at a level above the metatype maximum'),
  ('First Impression', 5, 'Character fits easily into a new environment'), 
  ('Focused Concentration', 10, '+1 (per rating point) dice pool modifier for all Drain tests'), --max rating 2
  ('Guts', 5, '+2 dice pool modifier on tests made to resist fear and intimidation'), 
  ('High Pain Tolerance', 5, 'Character can ignore one box of damage per rating point when calculating wound modifiers'),  -- max rating 3
  ('Home Ground', 10, '+2 dice pool modifier for all Active skill tests made on home ground; +4 modifier to all Knowledge skills relevant to the location'),
  ('Human-Looking', 5, 'Metahuman character can pass for human'), 
  ('Lucky', 20, 'Character may possess an Edge attribute one point higher than the metatype maximum'),
  ('Magician', 15, 'Character is a magician, starts with Magic attribute of 1'), 
  ('Magic Resistance', 5, '+1 additional die per rating point for Spell Resistance tests'), -- max rating 4
  ('Mentor Spirit', 5, 'Patron mentor spirit'), -- only for Magic users 
  ('Murky Link', 10, 'Any ritual sorcery directed against the character receives a -3 dice pool modifier'), 
  ('Mystic Adept', 10, 'Character is a mystic adept, starts with Magic attribute of 1'),
  ('Natural Hardening', 10, '1 point of natural biofeedback filtering'),
  ('Natural Immunity (5 BP)', 5, 'Character is immune to a single natural disease or toxin'),
  ('Natural Immunity (10 BP)', 10, 'Character is immune to a single synthetic disease or toxin'), 
  ('Photographic Memory'), 10, '-1 threshold modifier to Memory Tests'), 
  ('Quick Healer', 10, '+2 dice pool modifier to Healing tests made on/for/by him'),
  ('Resistance to Pathogens/Toxins (5 BP)', 5, 'Character is either resistant to pathogens or toxins (+1 to Resistance Tests)'),
  ('Resistance to Pathogens/Toxins (10 BP)', 10, 'Character is resistant to both pathogens and toxins (+1 to Resistance Tests)'),
  ('Spirit Affinity', 10, 'Character is naturally attuned to one type of spirit'), 
  ('Technomancer', 5, 'Character is a technomancer and starts with a Resonance attribute of 1'), 
  ('Toughness', 10, '+1 dice pool modifier to Body when making Damage Resistance Tests'),
  ('Will to Live', 5, '1 additional Damage Overflow Box per rating point'), -- max rating 3
 -- Negative
  ('Addiction (Mild)', -5, 'Addict experiences cravings once a week, -2 dice pool modifier to tests to resist the craving'),
  ('Addiction (Moderate)', -10, 'Cravings at least once a day, -4 to tests to resist the craving'), 
  ('Addiction (Severe)', -20, 'Cravings at least twice a day, -6 to tests to resist the craving'), 
  ('Addiction (Burnout)', -30, 'Same as Addiction (Severe), but reduce Essence by 1'),
  ('Allergy (Uncommon, Mild)', -5, 'Substance is rare for the local environment; symptoms are distracting (-2 to all tests)'),
  ('Allergy (Uncommon, Moderate)', -10, 'Substance is rare for the local environment; contact with allergen produces intense pain (-4 to all tests; +2 to DV of weapons made from allergen when used against the character)'),
  ('Allergy (Uncommon, Severe'), -15, 'Substance is rare for the local environment; character receives 1 box of damage for every minute exposed to the allergen; -4 to all tests, +4 to DV of weapons made from allergen when used against the character'),
  ('Allergy (Common, Mild)', -10, 'Substance is common in the local environment; symptoms are distracting (-2 to all tests)'),
  ('Allergy (Common, Moderate)', -15,  'Substance is common in the local environment; contact with allergen produces intense pain (-4 to all tests; +2 to DV of weapons made from allergen when used against the character)'),
  ('Allergy (Common, Severe)', -20, 'Substance is common in the local environment; character receives 1 box of damage for every minute exposed to the allergen; -4 to all tests, +4 to DV of weapons made from allergen when used against the character'),
  ('Astral Beacon', -5, 'Astral signatures last twice as long, +2 to others assensing the signature'), -- Magic users only
  ('Bad Luck', -20, 'Whenever character uses Edge, roll 1D6; on a result of 1, it has the exact opposite effect intended'),
  ('Codeblock', -5, '-2 modifier to a particular Matrix action'), 
  ('Combat Paralysis', -20, 'Character only rolls half her Initiative attribute on her first Initiative Test in combat; -3 on Surprise Tests; +1 threshold modifier to all Composure Tests in combat'),
  ('Elf Poser', -5, 'Human character pretends to be an elf'), -- only for humans
  ('Gremlins', -5, 'reduce the number of rolled 1s necessary to get a glitch while using a moderately sophisticated device by 1 per rating point'), -- max rating 4
  ('Incompetent', -5, 'Character possesses a total lack of knowledge or ability with a certain Active skill'), 
  ('Infirm', -20, 'Character possesses substandard physical fitness'), 
  ('Low Pain Tolerance', -10, 'Character incurs a -1 wound modifier for every 2 boxes of cumulative damage, instead of the normal 3 boxes'), 
  ('Ork Poser', -5, 'Character pretends to be an ork'), -- only humans or elves
  ('Pacifist (5 BP)', -5, 'Character actively avoids needless violence, will not kill unless in self-defense'), 
  ('Pacifist (10 BP)', -10, 'Character will refuse to harm any living creature, regardless of the provocation'), 
  ('Scorched (5 BP)', -5, '-2 dice pool modifier to Willpower-related tests made when facing black IC or BTLs'),
  ('Scorched (10 BP)', -10, 'As the 5 BP quality, for hacker/technomancer characters'),
  ('Sensitive Neural Structure (5 BP)', -5, '-2 dice pool modifier to resist damage from Simsense'), 
  ('Sensitive Neural Structure (10 BP)', -10, 'As the 5 BP quality, for hacker/technomancer characters'),   
  ('Sensitive System', -15, 'Double all Essence losses caused by cyberware implants'), 
  ('Simsense Vertigo (10 BP)', -10, '-2 dice pool modifier to tests when interacting with AR, VR or simsense'), 
  ('Simsense Vertigo (15 BP)', -15, 'As the 10 BP quality, for hacker/technomancer characters'),   
  ('SINner (5 BP)', -5, 'Character has a standard legal SIN'), 
  ('SINner (10 BP)', -10, 'Character has a criminal SIN'), 
  ('Spirit Bane', -10, 'Character is actively disliked by one type of spirit'), 
  ('Uncouth', -20, 'Character has a difficult time interacting with others'), 
  ('Uneducated', -20, 'Character is ignorant of modern society'), 
  ('Weak Immune System', -5, '-2 dice pool modifier to any tests for resisting diseases')
  ;
    
-- CREATE TABLE Spells
-- (
-- Name TEXT NOT NULL PRIMARY KEY,
-- Category TEXT NOT NULL,
-- SpellType TEXT NOT NULL,
-- SpellRange TEXT NOT NULL,
-- Threshold INTEGER,
-- Duration TEXT NOT NULL,
-- DrainValue TEXT NOT NULL,
-- DamageType
-- Description TEXT
-- -- stuff
-- );

INSERT INTO Spells
 (Name, Category, SpellDescriptors, SpellType, SpellRange, DamageType, Threshold, Duration, DrainValue, Description)
VALUES
  -- Core book
 -- Combat Spells
 ('Acid Stream', 'Combat', 'Indirect, Elemental', 'P', 'LOS', 'P', 0, 'I', '(F/2) + 3', 'Creates a powerful corrosive that sprays the target (Acid damage)'),
 ('Toxic Wave', 'Combat', 'Indirect, Elemental, Area', 'P', 'LOS (A)', 'P', 0, 'I', '(F/2) + 5', 'Creates a powerful corrosive that sprays an area (Acid damage). Area spell'),   
 ('Punch', 'Combat', 'Indirect, Touch', 'P', 'T',  'S',  0, 'I', '(F/2) - 2','Smacks the target with psychokinetic force, inflicting Stun damage, requiring the caster to touch the target'), 
 ('Clout', 'Combat', 'Indirect', 'P', 'LOS',  'S',  0, 'I', '(F/2)', 'S', 'Smacks the target with psychokinetic force, inflicting Stun damage'),    
 ('Blast', 'Combat', 'Indirect, Area', 'P', 'LOS (A)', 'S',  0, 'I', '(F/2) + 2', 'Smacks the targets with psychokinetic force, inflicting Stun damage. Area spell'), 
 ('Death Touch', 'Combat', 'Direct, Touch', 'M', 'T', 'P', 0, 'I', 'F/2 - 2', 'Channels destructive magical power into the target, inflicting Physical damage, requiring the caster to touch the target'),
 ('Manabolt', 'Combat', 'Direct', 'M', 'LOS', 'P', 0, 'I', 'F/2'), 'Channels destructive magical power into the target, inflicting Physical damage'),
 ('Manaball', 'Combat', 'Direct, Area', 'M', 'LOS (A)', 'P', 0, 'I', 'F/2 + 2', 'Channels destructive magical power into the targets, inflicting Physical damage. Area spell'),
 ('Flamethrower', 'Combat', 'Indirect, Elemental', 'P', 'LOS', 'P', 0, 'I', 'F/2 + 3', 'Creates an explosion of flames that scorches the target (Fire damage)'), 
 ('Fireball', 'Combat', 'Indirect, Elemental, Area', 'P', 'LOS (A)', 'P', 0, 'I', 'F/2 + 5', 'Creates an explosion of flames that scorches the targets (Fire damage). Area spell'), 
 ('Lightning Bolt', 'Combat', 'Indirect, Elemental', 'P', 'LOS', 'P', 0, 'I', 'F/2 + 3', 'Creates a direct strike of electricity, causing Electricity damage'), 
 ('Ball Lightning', 'Combat', 'Indirect, Elemental, Area', 'P', 'LOS (A)', 'P', 0, 'I', 'F/2 + 3', 'Creates a direct strike of electricity, causing Electricity damage. Area spell'), 
 ('Shatter', 'Combat', 'Direct, Touch', 'P', 'T', 'P', 0, 'I', 'F/2 - 1', 'Channels destructive energy into the target, inflicting Physical damage. Affects living and non-living objects. Touch spell'),
 ('Powerbolt', 'Combat', 'Direct', 'P', 'LOS', 'P', 0, 'I', 'F/2 + 1', 'Channels destructive energy into the target, inflicting Physical damage. Affects living and non-living objects.'),
 ('Powerball', 'Combat', 'Direct, Area', 'P', 'LOS (A)', 'P', 0, 'I', 'F/2 + 3', 'Channels destructive energy into the target, inflicting Physical damage. Affects living and non-living objects. Area spell'),
 ('Knockout', 'Combat', 'Direct, Touch', 'M', 'T', 'S', 0, 'I', 'F/2 - 3', 'Channels energy directly into the target, causing Stun damage. Touch spell'),
 ('Stunbolt', 'Combat', 'Direct', 'M', 'LOS', 'S', 0, 'I', 'F/2 - 1', 'Channels energy directly into the target, causing Stun damage'), 
 ('Stunball', 'Combat', 'Direct, Area', 'M', 'LOS (A)', 'S', 0, 'I', 'F/2 + 1', 'Channels energy directly into the target, causing Stun damage. Area spell'), 
 -- Detection Spells
 ('Analyze Device', 'Detection', 'Active, Directional', 'P', 'T', null, 0, 'S', 'F/2', 'Analyzes the purpose and operation of a device or piece of equipment'),
 ('Analyze Truth', 'Detection', 'Active, Directional', 'M', 'T', null, 1, 'S', 'F/2', 'Caster can tell whether a target''s statements are the truth'),
 ('Clairaudience', 'Detection', 'Passive, Directional', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Caster can hear distant sounds as if physically present at a chosen point within range of the spell'),
 ('Clairvoyance',  'Detection', 'Passive, Directional', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Caster can see distant scenes as if physically present at a chosen point within range of the spell'), 
 ('Combat Sense',  'Detection', 'Active, Psychic', 'M', 'T', null, 0, 'S', 'F/2 + 2', '+1 die per net hit for Reaction on Surprise Tests and when defending against ranged and melee attacks'),
 ('Detect Enemies',  'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2 + 1', 'Detects living targets within range who have hostile intentions against the character'),
 ('Detect Enemies, Extended',  'Detection', 'Active, Extended Area', 'M', 'T', null, 0, 'S', 'F/2 + 3', 'Detects living targets within range who have hostile intentions against the character'),
 ('Detect Individual',  'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Detects the presence of a particular individual within range'), 
 ('Detect Life', 'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2'. 'Detects living beings within range of the sense'),
 ('Detect Life, Extended', 'Detection', 'Active, Extended Area','M', 'T', null, 0, 'S', 'F/2 + 2', 'Detects living beings within the range of the sense'), 
 ('Detect [Life Form]', 'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Detects all of a specified type of life form within the range of the sense'), 
 ('Detect [Life Form], Extended', 'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2 + 1', 'Detects all of a specified type of life form within the range of the sense'), 
 ('Detect Magic', 'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2', 'Detects presence of all foci, spells, wards, magical lodges and spirits'),
 ('Detect Magic, Extended', 'Detection', 'Active, Extended Area', 'M', 'T', null, 0, 'S', 'F/2 + 2', 'Detects presence of all foci, spells, wards, magical lodges and spirits'), 
 ('Detect [Object]', 'Detection', 'Active, Area', 'P', 'T', null, 0, 'S', 'F/2 -1', 'Detects all of a specified type of object within range of the sense'),
 ('Mindlink', 'Detection', 'Active, Psychic', 'M', 'T', null, 1, 'S', 'F/2 + 1', 'Allows the caster and one voluntary subject to communicate mentally'),
 ('Mind Probe', 'Detection', 'Active, Directional', 'M', 'T', null, 1, 'S', 'F/2 + 2', 'Allows the subject to telepathically probe the mind of a specific target'),
 -- Health spells
 ('Antidote', 'Health', null, 'M', 'T', null, 1, 'P', '(Toxin DV) - 2', 'Helps a poisoned subject to overcome a toxin'),
 ('Cure Disease', 'Health', null, 'M', 'T', null, 1, 'P', '(Disease DV) - 2', 'Helps a patient overcome illness'), 
 ('Decrease [Attribute]', 'Health', 'Negative', 'P', 'T', null, 1, 'S', 'F/2 + 1', 'Decreases a chosen Physical or Mental attribute of the target'),  
 ('Detox', 'Health', null, 'M', 'T', null, 1, 'P', '(Toxin DV) - 4', 'Relieves the side effects of a drug or poison'),
 ('Heal', 'Health', null, 'M', 'T', null, 0, 'P', '(Damage Value) - 2', 'Repairs physical injuries'),
 ('Hibernate', 'Health', null, 'M', 'T', null, 0, 'S', '(F/2 - 3)', 'Slows the subject''s metabolism'), 
 ('Increase [Attribute]', 'Health', null, 'P', 'T', null, 1, 'S', 'F/2 - 2', 'Increases a chosen Physical or Mental attribute of the target'), 
 ('Increase Reflexes', 'Health', null, 'P', 'T', null, 2, 'S', 'F/2 + 2', 'Increases the Initiative and Initiative Passes of a voluntary subject'),
 ('Oxygenate', 'Health', null, 'P', 'T', null, 1, 'S', 'F/2 - 1', 'Provides +1 Body dice per hit to resist effects of oxygen deprivation; allows subject to breathe underwater'),
 ('Prophylaxis', 'Health', null, 'M', 'T', null, 1, 'S', 'F/2 - 2', 'Provides +1 dice per hit for a voluntary subject to resist infection, drugs or toxins'), 
 ('Resist Pain', 'Health', null, 'M', 'T', null, 1, 'P', '(Damage Value) - 4', 'Reduces the wound modifiers from Physical or Stun damage'),
 ('Stabilize', 'Health', null, 'M', 'T', null, 1, 'P', '(Overflow Damage) - 2', 'Stabilizes a character with a filled Physical damage track, preventing her from dying'), 
 -- Illusion Spells
 ('Confusion', 'Illusion', 'Realistic, Multi-Sense', 'M', 'LOS', null, 1, 'S', 'F/2', 'Produces a storm of conflicting sensations and images to confuse the senses.'),
 ('Mass Confusion', 'Illusion', 'Realistic, Multi-Sense, Area', 'M', 'LOS (A)', null, 1, 'S', 'F/2 + 2', 'Produces a storm of conflicting sensations and images to confuse the senses. Area spell'),
 ('Chaos', 'Illusion', 'Realistic, Multi-Sense', 'M', 'LOS', null, 1, 'S', 'F/2 + 1', 'Produces a storm of conflicting sensations and images to confuse the senses. Also affects technological systems.'),
 ('Chaotic World', 'Illusion', 'Realistic, Multi-Sense, Area', 'M', 'LOS (A)', null, 1, 'S', 'F/2 + 3', 'Produces a storm of conflicting sensations and images to confuse the senses. Also affects technological systems. Area spell'),
 ('Entertainment', 'Illusion', 'Obvious, Multi-Sense, Area', 'M', 'LOS (A)', null, 1, 'S', 'F/2 + 1', 'Creates obvious, but entertaining, illusions'), 
 ('Trid Entertainment', 'Illusion', 'Obvious, Multi-Sense, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 + 1', 'Creates obvious, but entertaining, illusions. Can be perceived by both living subjects and non-living sensors'), 
 ('Invisibility', 'Illusion', 'Realistic, Single-Sense', 'M', 'LOS', null, 1, 'S', 'F/2', 'Makes a subject more difficult to detect by normal visual senses'), 
 ('Improved Invisibility',  'Illusion', 'Realistic, Single-Sense', 'P', 'LOS', null, 1, 'S', 'F/2 + 1', 'Makes a subject more difficult to detect by normal visual senses. Also affects technological sensors'), 
 ('Mask', 'Illusion', 'Realistic, Multi-Sense', 'M', 'T', null, 1, 'S', 'F/2', 'Subject assumes a different physical appearance'), 
 ('Physical Mask', 'Illusion', 'Realistic, Multi-Sense', 'P', 'T', null, 1, 'S', 'F/2 + 1', 'Subject assumes a different physical appearance. Also affects technological sensors'), 
 ('Phantasm', 'Illusion', 'Realistic, Multi-Sense, Area', 'M', 'LOS (A)', null, 1, 'S', 'F/2 + 2', 'Creates convincing illusions of any object, creature or scene the caster desires'), 
 ('Trid Phantasm', 'Illusion', 'Realistic, Multi-Sense, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 + 3', 'Creates convincing illusions of any object, creature or scene the caster desires. Also affects technological sensors'), 
 ('Hush', 'Illusion', 'Realistic, Single-Sense, Area', 'M', 'LOS (A)', null, 1, 'S', 'F/2 + 2', 'Creates an area that damps sound'),
 ('Silence', 'Illusion', 'Realistic, Single-Sense, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 + 3', 'Creates an area that damps sound. Also affects technological devices'),
 ('Stealth', 'Illusion', 'Realistic, Single-Sense', 'P', 'LOS', null, 1, 'S', 'F/2 + 1', 'Makes the subject less audible to normal hearing'), 
 -- Manipulation Spells
 ('Armor', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 3', 'Creates a field of magical energy around the subject that protects against Physical damage'),
 ('Control Actions', 'Manipulation', 'Mental', 'M', 'LOS', null, 1, 'S', 'F/2', 'Controls the physical actions of a target'),
 ('Mob Control', 'Manipulation', 'Mental, Area', 'M', 'LOS (A)', null, 1, 'S', 'F/2 + 2', 'Controls the physical actions of all living targets within the area of effect'), 
 ('Control Emotions', 'Manipulation', 'Mental', 'M', 'LOS', null, 1, 'S', 'F/2 + 2', 'The target feels an overwhelming emotion chosen by the spellcaster'), 
 ('Mob Mind', 'Manipulation', 'Mental, Area', 'M', 'LOS', null, 1, 'S', 'F/2 + 4', 'All living targets within the area of effect feel an overwhelming emotion chosen by the spellcaster'), 
 ('Fling', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'I', 'F/2 + 1', 'Psychokinetically hurls a single object at a designated target'), 
 ('Ice Sheet', 'Manipulation', 'Environmental, Area', 'P', 'LOS (A)', null, 1, 'I', 'F/2 + 3', 'Creates a slippery sheet of ice over the area of effect'), 
 ('Ignite', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'P', 'F/2', 'Causes the target to catch fire'), 
 ('Influence', 'Manipulation', 'Mental', 'M', 'LOS', null, 1, 'P', 'F/2', 'Implants a single suggestion in the victim''s mind'), 
 ('Levitate', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 1', 'Caster may psychokinetically lift a person or object and move it around'), 
 ('Light', 'Manipulation', 'Environmental, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 - 1', 'Creates a mobile point of light'), 
 ('Magic Fingers', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 1', 'Creates a psychokinetic effect like invisible hands that can hold or manipulate objects'), 
 ('Mana Barrier', 'Manipulation', 'Environmental, Area', 'M', 'LOS', null, 1, 'S', 'F/2 + 1', 'Creates an invisible barrier of magical energy'), 
 ('Petrify', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 2', 'Transforms living tissue into stone-like calcium carbonate'), 
 ('Physical Barrier', 'Manipulation', 'Environmental, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 + 3', 'Creates a physical barrier'), 
 ('Poltergeist', 'Manipulation', 'Environmental, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 + 3', 'Picks up small object and whirls them around in random patterns'), 
 ('Shadow', 'Manipulation', 'Environmental, Area', 'P', 'LOS (A)', null, 1, 'S', 'F/2 + 1', 'Creates a globe of darkness'), 
 ('Shapechange', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 2', 'Transforms a voluntary subject into a normal critter'),
 ('[Critter] Form', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 1', 'Transforms a voluntary subject into one specific non-paranormal critter')
 ('Turn to Goo', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 2', 'Transforms living tissue into a sticky, glue-like substance');
 


INSERT INTO Gear
(GearType, GearName, Availability, Restriction, NuyenCost, HasRating)
VALUES
-- Core Book 
-- Melee Weapons

-- Blades
('MeleeWeapon', 'Combat Axe', 8, 'R', 600),
('MeleeWeapon', 'Forearm Snap-Blades', 6, 'R', 150),
('MeleeWeapon', 'Katana', 4, 'R', 1000),
('MeleeWeapon', 'Knife', null, null, 20),
('MeleeWeapon', 'Monofilament Sword', 8, 'R', 750),
('MeleeWeapon', 'Survival Knife', null, null, 50),
('MeleeWeapon', 'Sword', 4, 'R', 350)

-- Clubs
('MeleeWeapon', 'Club', null, null, 30),
('MeleeWeapon', 'Extendable Baton', null, null, 50),
('MeleeWeapon', 'Sap', null, null, 30),
('MeleeWeapon', 'Staff', null, null, 50),
('MeleeWeapon', 'Stun Baton', 4, 'R', 400)

-- Exotic
('MeleeWeapon', 'Monofilament Whip', 12, 'F', 3000),
('MeleeWeapon', 'Pole Arm', 4, 'R', 1000),

-- Unarmed
('MeleeWeapon', 'Shock Glove', 3, 'R', 200)

-- Projectile weapons
('ProjectileWeapon', 'Bow', 2, null, 100), -- Rating
('ProjectileWeapon', 'Light Crossbow', 2, null, 300),
('ProjectileWeapon', 'Medium Crossbow', 4, 'R', 500),
('ProjectileWeapon', 'Heavy Crossbow', 8, 'R', 750),

-- Thrown weapons
('ProjectileWeapon', 'Shuriken', 2, null, 30),
('ProjectileWeapon', 'Throwing Knife', 2, null, 20),

-- Tasers
('Firearms', 'Defiance EX Shocker', null, null, 150),
('Firearms', 'Yamaha Pulsar', null, null, 150),

-- Hold-out
('Firearms', 'Raecor Sting', 6, 'R', 350),
('Firearms', 'Streetline Special', 4, 'R', 100),

-- Light Pistols
('Firearms', 'Colt America L36', 4, 'R', 150),
('Firearms', 'Fichetti Security 600', 6, 'R', 450),
('Firearms', 'Hammerli 620S', 8, 'R', 650),
('Firearms', 'Yamaha Sakura Fubuki', 10, 'R', 2000),

-- Heavy Pistols
('Firearms', 'Ares Predator IV', 4, 'R', 350),
('Firearms', 'Ares Viper Slivergun', 5, 'R', 500),
('Firearms', 'Colt Manhunter', 4, 'R', 300),
('Firearms', 'Remington Roomsweeper', 6, 'R', 250),
('Firearms', 'Ruger Super Warhawk', 3, 'R', 250),

-- Machine Pistols
('Firearms', 'Ceska Black Scorpion', 3, 'R', 250),
('Firearms', 'Steyr TMP', 8, 'R', 600),

-- Submachine Guns
('Firearms', 'AK-97 Carbine', 4, 'R', 400),
('Firearms', 'HK-227X', 8, 'R', 800),
('Firearms', 'HK MP-5 TX', 4, 'R', 550),
('Firearms', 'Ingram Smartgun X', 6, 'R', 650),
('Firearms', 'Uzi IV', 4, 'R', 500),

-- Assault Rifles
('Firearms', 'AK-97', 4, 'R', 500),
('Firearms', 'Ares Alpha', 12, 'F', 1700),
('Firearms', 'FN HAR', 8, 'R', 1000),
('Firearms', 'HK XM30', 15, 'F', 2500)
('Firearms', 'HK XM30 Shotgun Module', null, null, 1000),
('Firearms', 'HK XM30 Carbine Module', null, null, 500),
('Firearms', 'HK XM30 Sniper Module', null, null, 1000),
('Firearms', 'HK XM30 LMG Module', null, null, 1000),

-- Sport Rifles
('Firearms', 'Ruger 100', 4, 'R', 900),
('Firearms', 'PJSS Elephant Rifle', 12, 'R', 6000),

-- Sniper Rifles
('Firearms', 'Ranger Arms SM-4', 16, 'F', 6200),
('Firearms', 'Walter MA-2100', 10, 'F', 5000),

-- Shotguns
('Firearms', 'Mossberg AM-CMDT', 12, 'R', 1000),
('Firearms', 'Remington 990', 4, 'R', 550),

-- Special Weapons
('Firearms', 'Ares S-III Super Squirt', 4, null, 500),
('Firearms', 'Fichetti Pain Inducer', 8, 'R', 2000),
('Firearms', 'Parashield Dart Pistol', 6, 'R', 600),
('Firearms', 'Parashield Dart Rifle', 6, 'R', 1700),

-- LMG
('Firearms', 'Ingram White Knight', 12, 'F', 2000),

-- MMG
('Firearms', 'Stoner-Ares M202', 12, 'F', 4500),

-- HMG
('Firearms', 'Ultimax HMG-2', 15, 'F', 7500),

-- Assault Cannons
('Firearms', 'Panther XXL', 20, 'F', 5500),

-- Grenade Launchers
('Firearms', 'Ares Antioch-2', 8, 'F', 600),
('Firearms', 'ArmTech MGL-12', 10, 'F', 2000),

-- Missile Launchers
('Firearms', 'Aztechnology Striker', 10, 'F', 1000),
('Firearms', 'Mitsubishi Yakusoku MRL', 20, 'F', 12000), 

-- Ammunition
('Ammunition', 'APDS', 16, 'F', 70),
('Ammunition', 'Assault Cannon', 16, 'F', 450),
('Ammunition', 'Explosive Rounds', 8, 'F', 50),
('Ammunition', 'EX-Explosive Rounds', 12, 'F', 100),
('Ammunition', 'Flechette Rounds', 2, 'R', 100),
('Ammunition', 'Gel Rounds', 4, 'R', 30),
('Ammunition', 'Injection Darts', 4, 'R', 75),
('Ammunition', 'Regular Ammo', 2, 'R', 20),
('Ammunition', 'Stick-n-Shock', 5, 'R', 80),
('Ammunition', 'Tracer', 5, 'R', 75),
('Ammunition', 'Taser Dart', 2, null, 50),
('Ammunition', 'Arrow', 2, null, 5),
('Ammunition', 'Injection Arrow', 8, 'R', 50),
('Ammunition', 'Crossbow Bolt', 2, null, 5),
('Ammunition', 'Injection Bolt', 8, 'R', 50)

('FirearmAccessory', 'Airburst Link', 6, 'R', 500),
('FirearmAccessory', 'Bipod', 2, null, 100),
('FirearmAccessory', 'Concealable Holster', 2, null, 75),
('FirearmAccessory', 'Gas-Vent 2 System', 4, 'R', 200),
('FirearmAccessory', 'Gas-Vent 3 System', 6, 'R', 400),
('FirearmAccessory', 'Gyro Stabilization', 7, null, 3000),
('FirearmAccessory', 'Hidden Gun Arm Slide', 4, null, 350),
('FirearmAccessory', 'Imaging Scope', 3, null, 300),
('FirearmAccessory', 'Laser Sight', 2, null, 100),
('FirearmAccessory', 'Periscope', 3, null, 50),
('FirearmAccessory', 'Quick-Draw Holster', 4, null, 100),
('FirearmAccessory', 'Shock Pad', 2, null, 50),
('FirearmAccessory', 'Silencer', 8, 'F', 200),
('FirearmAccessory', 'Smart Firing Platform', 12, 'F', 2000),
('FirearmAccessory', 'Smartgun System, internal', 6, 'R', 0), -- Weapon Cost
('FirearmAccessory', 'Smartgun System, external', 4, 'R', 400),
('FirearmAccessory', 'Sound Suppresser', 12, 'F', 300),
('FirearmAccessory', 'Spare Clips', 4, null, 5),
('FirearmAccessory', 'Speed Loader', 2, null, 25),
('FirearmAccessory', 'Tripod', 4, null, 300)

('Grenade', 'Flash-Bang Grenade', 6, 'R', 30),
('Grenade', 'Flash-Pak', 4, null, 200),
('Grenade', 'Fragmentation Grenade', 10, 'F', 35),
('Grenade', 'High Explosive Grenade', 7, 'F', 45),
('Grenade', 'Gas Grenade', 4, null, 20),
('Grenade', 'Smoke Grenade', 4, 'R', 30),
('Grenade', 'Thermal Smoke Grenade', 6, 'R', 35),

('Grenade', 'Anti-Vehicle Rocket', 20, 'F', 1000),
('Grenade', 'Fragmentation Rocket', 16, 'F', 500),
('Grenade', 'High Explosive Rocket', 20, 'F', 750),

('Explosive', 'Commercial Explosive', 8, 'R', 100),
('Explosive', 'Foam Explosive', 12, 'F', 100),
('Explosive', 'Plastic Explosive', 16, 'F', 100),

('ExplosiveAccessories', 'Detonator Cap', 8, 'R', 75),

('Armour', 'Leather Jacket', null, null, 200),
('Armour', 'Feedback Clothing', 8, null, 500),
('Armour', 'Actioneer Business Clothes', 8, null, 1500),
('Armour', 'Armor Clothing', 2, null, 500),
('Armour', 'Armor Jacket', 2, null, 900),
('Armour', 'Armor Vest', 4, null, 600),
('Armour', 'Camouflage Suit', 4, null, 1200),
('Armour', 'Chameleon Suit', 10, 'R', 8000),
('Armour', 'Full Body Armor', 14, 'R', 6000),
('ArmourExtra', 'Full Body Helmet', null, null, 1000),
('ArmourExtra', 'Full Body Chemical Seal', 6, null, 5000),
('ArmourExtra', 'Full Body Environment Adaptation', 3, null, 2000),
('Armour', 'Lined Coat', 2, null, 700),
('Armour', 'Urban Explorer Jumpsuit', 8, null, 500),
('ArmourExtra', 'Urban Explorer Helmet', null, null, 50),
('Armour', 'Helmet', 2, null, 100),
('Armour', 'Ballistic Shield', 12, 'R', 1500),
('Armour', 'Riot Shield', 6, 'R', 200),
('Armour', 'Taser Shield', 10, 'R', 750),

-- Armour modifications still missing!

('Commlink', 'Meta Link', null, null, 100),
('Commlink', 'CMT Clip', null, null, 300),
('Commlink', 'Sony Emperor', null, null, 700),
('Commlink', 'Renraku Sensei', null, null, 1000),
('Commlink', 'Novatech Airware', null, null, 1250),
('Commlink', 'Erika Elite', null, null, 2500),
('Commlink', 'Hermes Ikon', null, null, 3000),
('Commlink', 'Transys Avalon', null, null, 5000),
('Commlink', 'Fairlight Caliban', null, null, 8000)

('OS', 'Vector Xim', null, null, 200),
('OS', 'Redcap Nix', null, null, 400),
('OS', 'Renraku Ichi', null, null, 600),
('OS', 'Mangadyne Deva', null, null, 800),
('OS', 'Iris Orb', null, null, 1000),
('OS', 'Novatech Navi', null, null, 1500)
;

INSERT INTO OperatingSystems
(Name, Firewall, System)
VALUES
('Vector Xim', 1, 1),
('Redcap Nix', 1, 2),
('Renraku Ichi', 2, 2),
('Mangadyne Deva', 2, 3),
('Iris Orb', 3, 3),
('Novatech Navi', 3, 4)
;

INSERT INTO Commlinks
(Model, Response, Signal)
VALUES
('Meta Link', 1, 2),
('CMT Clip', 1, 3),
('Sony Emperor', 2, 3),
('Renraku Sensei', 2, 4),
('Novatech Airware', 3, 3),
('Erika Elite', 3, 4),
('Hermes Ikon', 4, 3),
('Transys Avalon', 4, 4),
('Fairlight Caliban', 4, 5)
;


INSERT INTO Armour
(Name, Ballistic, Impact)
VALUES
-- Core Book
('Leather Jacket', 2, 2),
('Feedback Clothing', null, null),
('Actioneer Business Clothes', 5, 3),
('Armor Clothing', 4, 0),
('Armor Jacket', 8, 6),
('Armor Vest', 6, 4), 
('Camouflage Suit', 8, 6),
('Chameleon Suit', 6, 4),
('Full Body Armor', 10, 8),
('Full Body Helmet', 2, 2),
('Lined Coat', 6, 4),
('Urban Explorer Jumpsuit', 6, 6),
('Urban Explorer Helmet', 0, 2),
('Helmet', 1, 2), 
('Ballistic Shield', 6, 4),
('Riot Shield', 2, 6),
('Taser Shield', 2, 6);



INSERT INTO Grenades
(Name, Damage, AP, Blast)
VALUES
('Flash-Bang Grenade', '6S', '-3', '10m Radius'),
('Flash-Pak', 'Special', null, 'Special'),
('Fragmentation Grenade', '12P(f)', '+5', '-1/m'),
('High Explosive Grenade', '10P', '-2', '-2/m'),
('Gas Grenade', 'Chemical', null, '10m Radius'),
('Smoke Grenade', null, null, '10m Radius'),
('Thermal Smoke Grenade', null, null, '10m Radius'),

('Anti-Vehicle Rocket', '16P', '-2/-6', '-4/m'),
('Fragmentation Rockets', '16P(f)', '+5', '-1/m'),
('High Explosive', '14P', '-2', '-2/m')
;



INSERT INTO Ammunition
(Name, DmgModifier, APModifier, ArmourUsed)
VALUES
-- core book
('APDS', null, '-4', 'Ballistic'),
('Assault Cannon', 'As Cannon', 'As Cannon', 'Ballistic'),
('Explosive Rounds', '+1', '0', 'Ballistic'),
('EX-Explosive Rounds', '+1', '-1', 'Ballistic'),
('Flechette Rounds', '+2', '+5', 'Impact'),
('Gel Rounds', '-1 (Stun)', '+2', 'Impact'),
('Injection Darts', 'As Drug/Toxin', null, 'Impact'),
('Regular Ammo', null, null, 'Ballistic'),
('Stick-n-Shock', '6S(e)', '-half', 'Impact'),
('Tracer', null, null, 'Ballistic'),
('Taser Dart', 'As Taser', '-half', 'Impact');

INSERT INTO MeleeWeapons
(Name, Reach, Damage, AP)
VALUES
-- Core Book
-- Blades
('Combat Axe', 2, '(STR/2 + 4) P', '-1'),
('Forearm Snap-Blades', null, '(STR/2 + 2) P', null),
('Katana', 1, '(STR/2 + 3) P', '-1'),
('Knife', null, '(STR/2 + 1) P', null),
('Monofilament Sword', 1, '(STR/2 + 3) P', '-1'),
('Survival Knife', null, '(STR/2 + 1) P', '-1'),
('Sword', 1, '(STR/2 + 3) P', null)

-- Clubs
('Club', 1, '(STR/2 + 1) P', null),
('Extendable Baton', 1,  '(STR/2 + 1) P', null),
('Sap', null,  '(STR/2 + 1) S', null),
('Staff', 2,  '(STR/2 + 2) P', null),
('Stun Baton', 1, '6S(e)', '-half'),

-- Exotic
('Monofilament Whip', 2, '8P', '-4'),
('Pole Arm', 2,  '(STR/2 + 2) P', '-2'),

-- Unarmed
('Shock Glove', null, '5S(e)', '-half')
;



INSERT INTO Firearms
(Name, Damage, AP, FiringMode, RC, Ammo)
VALUES
-- Tasers
('Defiance EX Shocker', null, null, 150),
('Yamaha Pulsar', null, null, 150),

-- Hold-out
('Raecor Sting', 6, 'R', 350),
('Streetline Special', 4, 'R', 100),

-- Light Pistols
('Colt America L36', 4, 'R', 150),
('Fichetti Security 600', 6, 'R', 450),
('Hammerli 620S', 8, 'R', 650),
('Yamaha Sakura Fubuki', 10, 'R', 2000),

-- Heavy Pistols
('Ares Predator IV', 4, 'R', 350),
('Ares Viper Slivergun', 5, 'R', 500),
('Colt Manhunter', 4, 'R', 300),
('Remington Roomsweeper', 6, 'R', 250),
('Ruger Super Warhawk', 3, 'R', 250),

-- Machine Pistols
('Ceska Black Scorpion', 3, 'R', 250),
('Steyr TMP', 8, 'R', 600),

-- Submachine Guns
('AK-97 Carbine', 4, 'R', 400),
('HK-227X', 8, 'R', 800),
('HK MP-5 TX', 4, 'R', 550),
('Ingram Smartgun X', 6, 'R', 650),
('Uzi IV', 4, 'R', 500),
-- (Name, Damage, AP, FiringMode, RC, Ammo)
-- Assault Rifles
('AK-97', '6P', '-1', 'SA/BF/FA', null, '38 (c)'),
('Ares Alpha', '6P', '-1', 'SA/BF/FA', '2', '42 (c)'),
('FN HAR', '6P', '-1', 'SA/BF/FA', '2', '35 (c)'),
('HK XM30', '6P', '-1', 'SA/BF/FA', '(1)', '30 (c)'),
('HK XM30 Shotgun Module', '7P', '+1', 'SA', '(1)', '10 (c)'),
('HK XM30 Carbine Module', '5P', null, 'SA/BF/FA', '(1)', '30 (c)'),
('HK XM30 Sniper Module', '7P', '-2', 'SA', '(1)', '10 (c)'),
('HK XM30 LMG Module', '6P', '-1', 'BF/FA', '2 (3)', '100 (belt)'),

-- Sport Rifles
('Ruger 100', '7P', '-1', 'SA', '(1)', '5 (m)'),
('PJSS Elephant Rifle', '9P', '-1', 'SS', '(1)', '2 (b)'),

-- Sniper Rifles
('Ranger Arms SM-4', '8P', '-3', 'SA', '(1)', '15 (c)'),
('Walter MA-2100', '7P', '-3', 'SA', '(1)', '10 (m)'),

-- Shotguns
('Mossberg AM-CMDT', '9P (f)', '+5', 'SA/BF/FA', null, '10 (c)'),
('Remington 990', '7P / 9P (f)', '-1 / +2', 'SA', '(1)', '8 (m)'),

-- Special Weapons
('Ares S-III Super Squirt', 'Chemical', null, 'SA', null, '20 (c)'),
('Fichetti Pain Inducer', 'Special', '-half', 'SS', null, 'Special'),
('Parashield Dart Pistol', 'As Drug/Toxin', '-2', 'SA', null, '5 (c)'),
('Parashield Dart Rifle', 'As Drug/Toxin', '-2', 'SA', '0', '10 (c)'),

-- LMG
('Ingram White Knight', '6P', '-1', 'BF/FA', '5 (6)', '50 (c) or 100 (belt)'),

-- MMG
('Stoner-Ares M202', '6P', '-2', 'FA', null, '50 (c) or 100 (belt)'),

-- HMG
('Ultimax HMG-2', '7P'. '-3', 'FA', '3 (10)', '50 (c) or 100 (belt)'),

-- Assault Cannons
('Panther XXL', '10P', '-5', 'SS', '1', '15 (C)'),

-- Grenade Launchers
('Ares Antioch-2', 'Grenade', null, 'SS', null, '8 (m)'),
('ArmTech MGL-12', 'Grenade', null, 'SA', null, '12 (c)'),

-- Missile Launchers
('Aztechnology Striker', 'Missile', null, 'SS', null, '1 (ml)'),
('Mitsubishi Yakusoku MRL', 'Missile', null, 'SA', null, '8 (m)')
;

INSERT INTO ProjectileWeapons
(Name, Damage, AP)
VALUES
-- Core Book
('Bow', 'Str Min +2) P', null),
('Light Crossbow', '3P', null),
('Medium Crossbow', '5P', null),
('Heavy Crossbow', '7P', -1),
('Shuriken', 'STR/2 P', null),
('Throwing Knife', '(STR/2 + 1) P', null);
