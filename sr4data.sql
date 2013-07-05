insert into Books
(Title)
values
('20th Anniversary Core Rulebook')
;


insert into Metatypes
    (Name, BaseBody, BaseAgility, BaseReaction, BaseStrength, BaseCharisma, BaseIntuition, BaseLogic, BaseWillpower, BaseEdge, MaxBody, MaxAgility, MaxReaction, MaxStrength, MaxCharisma, MaxIntuition, MaxLogic, MaxWillpower, MaxEdge, BPCost)
values
    ('Human', 1, 1, 1, 1, 1, 1, 1, 1, 2, 6, 6, 6, 6, 6, 6, 6, 6, 7, 0),
    ('Elf', 1, 2, 1, 1, 3, 1, 1, 1, 1, 6, 7, 6,6,8,6,6,6,6, 30),
    ('Ork', 4,1,1,3,1,1,1,1,1,9,6,6,8,5,6,5,6,6,20),
    ('Dwarf', 2,1, 1,3,1,1,1,2,1,7,6,5,8,6,6,6,7,6,25),
    ('Troll', 5,1,1,5,1,1,1,1,1,10,5,6,10,4,5,5,6,6,40),
    -- human metavariants
    ('Nartaki', 1, 1, 1, 1, 1, 1, 1, 1, 2, 6, 6, 6, 6, 6, 6, 6, 6, 7, 25),
    -- dwarf metavariants
    ('Gnome', 2,1, 1,3,1,1,1,2,1,7,6,5,8,6,6,6,7,6,25),
    ('Harumen', 2,1, 1,3,1,1,1,2,1,7,6,5,8,6,6,6,7,6,50),
    ('Koborokuru', 2,1, 1,3,1,1,1,2,1,7,6,5,8,6,6,6,7,6,35),
    ('Menehune', 2,1, 1,3,1,1,1,2,1,7,6,5,8,6,6,6,7,6,25),
    -- elf metavariants
    ('Dryad', 1, 2, 1, 1, 3, 1, 1, 1, 1, 6, 7, 6,6,8,6,6,6,6, 45),
    ('Night One', 1, 2, 1, 1, 3, 1, 1, 1, 1, 6, 7, 6,6,8,6,6,6,6, 35),
    ('Wakyambi', 1, 2, 1, 1, 3, 1, 1, 1, 1, 6, 7, 6,6,8,6,6,6,6, 35),
    ('Xapiri Thëpë', 1, 2, 1, 1, 3, 1, 1, 1, 1, 6, 7, 6,6,8,6,6,6,6, 40),
    -- ork metavariants
    ('Hobgoblin', 4,1,1,3,1,1,1,1,1,9,6,6,8,5,6,5,6,6,20),
    ('Ogre', 4,1,1,3,1,1,1,1,1,9,6,6,8,5,6,5,6,6,20),
    ('Oni', 4,1,1,3,1,1,1,1,1,9,6,6,8,5,6,5,6,6,25),
    ('Satyr', 4,1,1,3,1,1,1,1,1,9,6,6,8,5,6,5,6,6,25),
    -- troll metavariants
    ('Cyclops', 5,1,1,5,1,1,1,1,1,10,5,6,10,4,5,5,6,6,45),
    ('Fomori', 5,1,1,5,1,1,1,1,1,10,5,6,10,4,5,5,6,6,45),
    ('Giant', 5,1,1,5,1,1,1,1,1,10,5,6,10,4,5,5,6,6,40),
    ('Minotaur', 5,1,1,5,1,1,1,1,1,10,5,6,10,4,5,5,6,6,45);
    
insert into MetatypeSpecials
(Metatype, Special)
values
    ('Ork', 'Low-Light Vision'),
    ('Dwarf', 'Thermographic Vision'),
    ('Dwarf', 'Resistance to Pathogens/Toxins (2)'),
    ('Elf', 'Low-Light Vision'),
    ('Troll', 'Thermographic Vision'),
    ('Troll', '+1 natural melee reach'),
    ('Troll', '+1 natural armor'),
    ('Nartaki', 'Shiva arms'),
    ('Nartaki', 'Striking Skin Pigmentation'),
    ('Gnome', 'Arcane Arrester'),
    ('Gnome', 'Neoteny'),
    ('Gnome', 'Thermographic Vision'),
    ('Harumen', 'Low-Light Vision'),
    ('Harumen', 'Metagenetic Improvement (Agility)'),
    ('Harumen', 'Monkey Paws'),
    ('Harumen', 'Prehensile Tail'),
    ('Harumen', 'Unusual Hair (Body Hair)'),
    ('Koborokuru', 'Celerity'),
    ('Koborokuru', 'Resistance to Pathogens/Toxins (2)'),
    ('Koborokuru', 'Thermographic Vision'),
    ('Koborokuru', 'Unusual Hair'),
    ('Menehune', 'Resistance to Pathogens/Toxins (2)'),
    ('Menehune', 'Thermographic Vision'),
    ('Menehune', 'Underwater Vision'),
    ('Dryad', 'Glamour'),
    ('Dryad', 'Low-Light Vision'),
    ('Dryad', 'Symbiosis'),
    ('Night One', 'Allergy (Sunlight, mild)'),
    ('Night One', 'Low-Light Vision'),
    ('Night One', 'Keen-eared'),
    ('Night One', 'Nocturnal'),
    ('Night One', 'Unusual Hair (Colored Fur)'),
    ('Wakyambi', 'Celerity'),
    ('Wakyambi', 'Elongated Limbs'),
    ('Wakyambi', 'Low-Light Vision'),
    ('Xapiri Thëpë', 'Allergy (choose pollutant, Mild)'),
    ('Xapiri Thëpë', 'Allergy (choose second pollutant, Mild)'),
    ('Xapiri Thëpë', 'Low-Light Vision'),
    ('Xapiri Thëpë', 'Photometabolism'),
    ('Hobgoblin', 'Fangs'),
    ('Hobgoblin', 'Low-Light Vision'),
    ('Hobgoblin', 'Poor Self-Control: Vindictive'),
    ('Ogre', 'Low-Light Vision'),
    ('Ogre', 'Ogre Stomach'),
    ('Oni', 'Low-Light Vision'),
    ('Oni', 'Striking Skin Pigmentation'),
    ('Satyr', 'Low-Light Vision'),
    ('Satyr', 'Satyr Legs'),
    ('Cyclops', 'Cyclopean Eye'),
    ('Cyclops', 'Metagenetic Improvement (Strength)'),
    ('Cyclops', '+1 Reach'),
    ('Fomori', 'Arcane Arrester'),
    ('Fomori', 'Metagenetic Improvement (Body)'),
    ('Fomori', 'Thermographic Vision'),
    ('Fomori', '+1 Reach'),
    ('Giant', 'Dermal Alteration (Bark)'),
    ('Giant', 'Thermographic Vision'),
    ('Giant', '+1 Reach'),
    ('Minotaur', 'Goring Horns'),
    ('Minotaur', 'Metagenetic Improvement (Body)'),
    ('Minotaur', 'Thermographic Vision'),
    ('Minotaur', '+1 Reach');

    
        
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
    (Name, SkillGroup, IsActive, CanDefault, SkillAttribute, Description)
    values
    --  Combat 
    ('Archery', null, 1, 1, 'Agility', 'Use of muscle-powered projectile weapons'),
    ('Automatics', 'Firearms', 1, 1, 'Agility', 'Use of personal firearms capable of autofire, larger than a pistol, but typically with a shorter barrel than a longarm'),
    ('Blades', null, 1, 1, 'Agility', 'Use of hand-held melee weapons with a sharpened edge or point'),
    ('Clubs', null, 1, 1, 'Agility', 'Use of hand-held melee weapons that have no edge or blade'),
    ('Dodge', null, 1, 1, 'Reaction', 'Ability to move out of the way of a perceived attack or other incoming threat'),
    ('Exotic Melee Weapon', null, 1, 1, 'Agility', 'Must be taken separately for each different weapon you wish to be able to use'), -- Front end should take care of that; actually, create a new skill for each
    ('Exotic Ranged Weapon', null, 1, 1, 'Agility', 'Must be taken separately for each different weapon you wish to be able to use'),
    ('Heavy Weapons', null, 1, 1, 'Agility', 'Use of ranged projectile and launch weapons larger than an assault rifle'),
    ('Longarms', 'Firearms', 1, 1, 'Agility', 'Use of all personal firearms with extended barrels'),
    ('Pistols', 'Firearms', 1, 1, 'Agility', 'Use of all types of hand-held firearms'),
    ('Throwing Weapons', null, 1, 1, 'Agility', 'Use of any item thrown by the user'),
    ('Unarmed Combat', null, 1, 1, 'Agility', 'Use of combat techniques based solely on the use of own body parts'),
    --  Magical Active
    ('Arcana', null, 1, 0, 'Logic', 'Practical application of magical theory'),
    ('Assensing', null, 1, 0, 'Intuition', 'Learning information from auras, astral forms and astral signatures'), -- constraint: capable of astral perception?
    ('Astral Combat', null, 1, 0, 'Willpower', 'Fight while in astral space'), -- capable of astral perception
    ('Banishing', 'Conjuring', 1, 0, 'Magic', 'Disrupt spirits, removing them from the physical and astral planes'),
    ('Binding', 'Conjuring', 1, 0, 'Magic', 'Ask/demand long-term services from a spirit the magician has already summoned'),
    ('Counterspelling', 'Sorcery', 1, 0, 'Magic', 'Remove existing sustained spells, or defend against spells cast at them or others'),
    ('Enchanting', null, 1, 0, 'Magic', 'Techniques to create magical foci, spirit vessels, and to evaluate magical goods'), -- constraint: Adept/Magician/Mystic Adept, Magic attribute >= 1,
    ('Ritual Spellcasting', 'Sorcery', 1, 0, 'Magic', 'Cast spells in a ritual fashion'),
    ('Spellcasting', 'Sorcery', 1, 0, 'Magic', 'Cast spells'),
    ('Summoning', 'Conjuring', 1, 0, 'Magic', 'Summon spirits and determine how many services they owe'),
    -- Physical Active,
    ('Climbing', 'Athletics', 1, 1, 'Strength', 'Ascend vertical obstacles or walls'),
    ('Disguise', 'Stealth', 1, 1, 'Intuition', 'Take on a false appearance'),
    ('Diving', null, 1, 1, 'Body', 'All forms of underwater diving'),
    ('Escape Artist', null, 1, 1, 'Agility', 'Slip out of bonds or shackles without using brute force'),
    ('Gymnastics', 'Athletics', 1, 1, 'Agility', 'Acrobatics feats, balance, jumping, vaulting and tumbling'),
    ('Infiltration', 'Stealth', 1, 1, 'Agility', 'Sneak around undetected by either other characters or security sensors'),
    ('Navigation', 'Outdoors', 1, 1, 'Intuition', 'Determine directions, read maps, plot a course, stick to it without getting lost'),
    ('Palming', 'Stealth', 1, 1, 'Agility', 'Conceal small objects or remove them from others without being noticed'),
    ('Parachuting', null, 1, 1, 'Body', 'Exit a high area with a parachute and stop your quick descent'),
    ('Perception', null, 1, 1, 'Intuition', 'Determine what you notice about your surroundings that is abnormal or strange'),
    ('Running', 'Athletics', 1, 1, 'Strength', 'Increase the distance you can run, determine how well you can pace yourself'),
    ('Shadowing', 'Stealth', 1, 1, 'Intuition', 'Follow someone else discreetly without being noticed; ensure you are not followed the same way'),
    ('Survival', 'Outdoors', 1, 1, 'Willpower', 'Proficiency in surviving outdoors for an extended period of time'),
    ('Swimming', 'Athletics', 1, 1, 'Strength', 'Increase the distance you can swim; determines how much experience you have had with water'),
    ('Tracking', 'Outdoors', 1, 1, 'Intuition', 'Track metahumans or critters in the wild'),
    -- Resonance Active
    ('Compiling', 'Tasking', 1, 0, 'Resonance', 'Compile sprites and determine how many tasks they owe'),
    ('Decompiling', 'Tasking', 1, 0, 'Resonance', 'Decompile sprites'),
    ('Registering', 'Tasking', 1, 0, 'Resonance', 'Register sprites for long-term service'),
    -- Social Active
    ('Con', 'Influence', 1, 1, 'Charisma', 'Misrepresent the truth in some way, and get the others to believe you'),
    ('Etiquette', 'Influence', 1, 1, 'Charisma', 'Function within a specific subculture without appearing out of place'),
    ('Instruction', null, 1, 1, 'Charisma', 'Teach something efficiently to another character'),
    ('Intimidation', null, 1, 1, 'Charisma', 'Make people do what they normally might not, out of fear inspired by your appearance or behaviour'),
    ('Leadership', 'Influence', 1, 1, 'Charisma', 'Get others to do your bidding through example and authority'),
    ('Negotiation', 'Influence', 1, 1, 'Charisma', 'Bargaining tactics used when you deal with another character and seek to come out ahead'),
    -- Technical Active
    ('Aeronautics Mechanic', 'Mechanic', 1, 0, 'Logic', 'Repair and maintain aircraft'),
    ('Artisan', null, 1, 1, 'Intuition', 'Creative skills'),
    ('Automotive Mechanic', 'Mechanic', 1, 0, 'Logic', 'Repair and maintain ground craft'),
    ('Chemistry', null, 1, 0, 'Logic', 'Use and understanding of chemistry; proper laboratory procedure, ability to read chemical formulae'),
    ('Computer', 'Electronics', 1, 1, 'Logic', 'Use and understanding of computers and electronic devices'),
    ('Cybercombat', 'Cracking', 1, 1, 'Logic', 'Attack other icons in the Matrix, utilise attack programmes and system tricks'),
    ('Cybertechnology', 'Biotech', 1, 0, 'Logic', 'Create and care for cybernetics and bioware'),
    ('Data Search', 'Electronics', 1, 1, 'Logic', 'Use search engines, databases and other tools to track down information'),
    ('Demolitions', null, 1, 1, 'Logic', 'Preparation, measuring and setting of chemical explosives'),
    ('Electronic Warfare', 'Cracking', 1, 0, 'Logic', 'Disrupt communications in a variety of ways; encode and decode communications'),
    ('First Aid', 'Biotech', 1, 1, 'Logic', 'Basic medicine in a hands-on sense'),
    ('Forgery', null, 1, 1, 'Agility', 'Make a copy of a document or other item'),
    ('Hacking', 'Cracking', 1, 1, 'Logic', 'Exploit and subvert the programming of computers and electronics'), 
    ('Hardware', 'Electronics', 1, 0, 'Logic', 'Creation, repair and technical manipulation of computers and electronic devices'),
    ('Industrial Mechanic', 'Mechanic', 1, 0, 'Logic', 'Maintain and repair mechanical devices used in various industries'), 
    ('Locksmith', null, 1, 1, 'Agility', 'Manipulate, open and repair mechanical locks'), 
    ('Medicine', 'Biotech', 1, 0, 'Logic', 'Proper treatment of disease and illness as well as wounds, beyond what First Aid can do'), 
    ('Nautical Mechanic', 'Mechanic', 1, 0, 'Logic', 'Repair and maintain watercraft'), 
    ('Software', 'Electronics', 1, 0, 'Logic', 'Write utilities for use in the Matrix'), 
    -- Vehicle Active
    ('Gunnery', null, 1, 1, 'Agility', 'Use vehicle-mounted weapons'), 
    ('Pilot Aerospace', null, 1, 0, 'Reaction', 'Control parabolic aircraft, suborbital aircraft, and anything piloted outside the atmosphere'), 
    ('Pilot Aircraft', null, 1, 0, 'Reaction', 'Use aircraft piloted within the atmosphere'), 
    ('Pilot Anthroform', null, 1, 0, 'Reaction', 'Operate vehicle that walks on legs'), 
    ('Pilot Exotic Vehicle', null, 1, 0, 'Reaction', 'Must be taken separately for each exotic vehicle you wish to pilot'),
    ('Pilot Ground Craft', null, 1, 0, 'Reaction', 'Control ground vehicles without legs'),
    ('Pilot Watercraft', null, 1, 0, 'Reaction', 'Control water vehicles'),
    -- Language
    ('Language', null, 0, 0, 'Intuition', 'Must be taken separately for each language desired'), 
    -- Knowledge
    ('Knowledge', null, 0, 0, 'Logic', 'Must be taken separately for each knowledge skill desired'),
    ('Criminal Organizations', null, 0, 0, 'Logic', '')
    ;
    

INSERT INTO Qualities
  (Name, BPCost, Description)
VALUES
 -- Core Book
 -- Positive
  ('Adept', 5, 'Character is an adept, starts with Magic attribute of 1'),
  ('Ambidextrous', 5, 'Character can handle objects equally well with both hands'),
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
  ('Photographic Memory', 10, '-1 threshold modifier to Memory Tests'), 
  ('Quick Healer', 10, '+2 dice pool modifier to Healing tests made on/for/by them'),
  ('Resistance to Pathogens/Toxins (5 BP)', 5, 'Character is either resistant to pathogens or toxins (+1 to Resistance Tests)'),
  ('Resistance to Pathogens/Toxins (10 BP)', 10, 'Character is resistant to both pathogens and toxins (+1 to Resistance Tests)'),
  ('Spirit Affinity', 10, 'Character is naturally attuned to one type of spirit'), 
  ('Technomancer', 5, 'Character is a technomancer and starts with a Resonance attribute of 1'), 
  ('Toughness', 10, '+1 dice pool modifier to Body when making Damage Resistance Tests'),
  ('Will to Live', 5, '1 additional Damage Overflow Box per rating point'), -- max rating 3
   --      Negative
  ('Addiction (Mild)', -5, 'Addict experiences cravings once a week, -2 dice pool modifier to tests to resist the craving'),
  ('Addiction (Moderate)', -10, 'Cravings at least once a day, -4 to tests to resist the craving'), 
  ('Addiction (Severe)', -20, 'Cravings at least twice a day, -6 to tests to resist the craving'), 
  ('Addiction (Burnout)', -30, 'Same as Addiction (Severe), but reduce Essence by 1'),
  ('Allergy (Uncommon, Mild)', -5, 'Substance is rare for the local environment; symptoms are distracting (-2 to all tests)'),
  ('Allergy (Uncommon, Moderate)', -10, 'Substance is rare for the local environment; contact with allergen produces intense pain (-4 to all tests; +2 to DV of weapons made from allergen when used against the character)'),
  ('Allergy (Uncommon, Severe)', -15, 'Substance is rare for the local environment; character receives 1 box of damage for every minute exposed to the allergen; -4 to all tests, +4 to DV of weapons made from allergen when used against the character'),
  ('Allergy (Common, Mild)', -10, 'Substance is common in the local environment; symptoms are distracting (-2 to all tests)'),
  ('Allergy (Common, Moderate)', -15,  'Substance is common in the local environment; contact with allergen produces intense pain (-4 to all tests; +2 to DV of weapons made from allergen when used against the character)'),
  ('Allergy (Common, Severe)', -20, 'Substance is common in the local environment; character receives 1 box of damage for every minute exposed to the allergen; -4 to all tests, +4 to DV of weapons made from allergen when used against the character'),
  ('Astral Beacon', -5, 'Astral signatures last twice as long, +2 to others assensing the signature'), -- Magic users only
  ('Bad Luck', -20, 'Whenever character uses Edge, roll 1D6; on a result of 1, it has the exact opposite effect intended'),
  ('Codeblock', -5, '-2 modifier to a particular Matrix action'), 
  ('Combat Paralysis', -20, 'Character only rolls half their Initiative attribute on their first Initiative Test in combat; -3 on Surprise Tests; +1 threshold modifier to all Composure Tests in combat'),
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
  ('Weak Immune System', -5, '-2 dice pool modifier to any tests for resisting diseases'),
  -- Runner's Companion
  -- Positive
  ('Adrenaline Surge', 15, 'Act first in the first Initiative Pass of a new combat'),
  ('Analytical Mind', 5, '+2 dice to any Logic Tests involving pattern recognition, evidence analysis, clue hunting or puzzle solving; +2 to any Data Search and Software Tests'),
  ('Bilingual', 5, 'May list a second language as a Native tongue'),
  ('Black Market Pipeline', 10, 'Choose one contact and one type of merchandise; this contact can always buy or sell that contraband on the black market at a price that benefits the character'),
  ('Born Rich', 10, 'Character comes from an affluent background and can spend 60 BP on gear at character generation'),
  ('Catlike', 10, 'Uncanny elegance; +1 to Infiltration and Shadowing; character must buy at least rating 2 in these skills to benefit from this quality'),
  ('College Education', 5, 'Modifies the skill rating of any Academic Knowledge skill the character acquires by +1 (to maximum of rating 6)'),
  ('Common Sense', 5, 'Character is down-to-earth, practical and sensible. Any time the character is about to do something foolish, the gamemaster must warn the player'),
  ('Deep Cover (5 BP)', 5, 'Character''s actual identity is buried by manipulation and training, a trigger lets their real personality come forward until a second trigger brings it back to sleep.'),
  ('Deep Cover (10 BP)', 10, 'As in the 5 BP quality but the character knows what both triggers are and can set things up to bring herself in and out of deep cover on their schedule')  
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
 (Name, SpellCategory, SpellDescriptors, SpellType, SpellRange, DamageType, Threshold, Duration, DrainValue, Description)
VALUES
  -- Core book
 -- Combat Spells
 ('Acid Stream', 'Combat', 'Indirect, Elemental', 'P', 'LOS', 'P', 0, 'I', '(F/2) + 3', 'Creates a powerful corrosive that sprays the target (Acid damage)'),
 ('Toxic Wave', 'Combat', 'Indirect, Elemental, Area', 'P', 'LOS (A)', 'P', 0, 'I', '(F/2) + 5', 'Creates a powerful corrosive that sprays an area (Acid damage). Area spell'),   
 ('Punch', 'Combat', 'Indirect, Touch', 'P', 'T',  'S',  0, 'I', '(F/2) - 2','Smacks the target with psychokinetic force, inflicting Stun damage, requiring the caster to touch the target'), 
 ('Clout', 'Combat', 'Indirect', 'P', 'LOS',  'S',  0, 'I', '(F/2)', 'Smacks the target with psychokinetic force, inflicting Stun damage'),    
 ('Blast', 'Combat', 'Indirect, Area', 'P', 'LOS (A)', 'S',  0, 'I', '(F/2) + 2', 'Smacks the targets with psychokinetic force, inflicting Stun damage. Area spell'), 
 ('Death Touch', 'Combat', 'Direct, Touch', 'M', 'T', 'P', 0, 'I', 'F/2 - 2', 'Channels destructive magical power into the target, inflicting Physical damage, requiring the caster to touch the target'),
 ('Manabolt', 'Combat', 'Direct', 'M', 'LOS', 'P', 0, 'I', 'F/2', 'Channels destructive magical power into the target, inflicting Physical damage'),
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
 ('Stunball', 'Combat', 'Direct, Area', 'M', 'LOS (A)', 'S', 0, 'I', 'F/2 + 1', 'Channels energy directly into the target, causing Stun damage. Area spell')
 , 
 -- Detection Spells
 ('Analyze Device', 'Detection', 'Active, Directional', 'P', 'T', null, 0, 'S', 'F/2', 'Analyzes the purpose and operation of a device or piece of equipment'),
 ('Analyze Truth', 'Detection', 'Active, Directional', 'M', 'T', null, 1, 'S', 'F/2', 'Caster can tell whether a target''s statements are the truth'),
 ('Clairaudience', 'Detection', 'Passive, Directional', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Caster can hear distant sounds as if physically present at a chosen point within range of the spell'),
 ('Clairvoyance',  'Detection', 'Passive, Directional', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Caster can see distant scenes as if physically present at a chosen point within range of the spell'), 
 ('Combat Sense',  'Detection', 'Active, Psychic', 'M', 'T', null, 0, 'S', 'F/2 + 2', '+1 die per net hit for Reaction on Surprise Tests and when defending against ranged and melee attacks'),
 ('Detect Enemies',  'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2 + 1', 'Detects living targets within range who have hostile intentions against the character'),
 ('Detect Enemies, Extended',  'Detection', 'Active, Extended Area', 'M', 'T', null, 0, 'S', 'F/2 + 3', 'Detects living targets within range who have hostile intentions against the character'),
 ('Detect Individual',  'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2 - 1', 'Detects the presence of a particular individual within range'), 
 ('Detect Life', 'Detection', 'Active, Area', 'M', 'T', null, 0, 'S', 'F/2', 'Detects living beings within range of the sense'),
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
 ('[Critter] Form', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 1', 'Transforms a voluntary subject into one specific non-paranormal critter'),
 ('Turn to Goo', 'Manipulation', 'Physical', 'P', 'LOS', null, 1, 'S', 'F/2 + 2', 'Transforms living tissue into a sticky, glue-like substance')
 ;
 


INSERT INTO Gear
(GearType, GearName, Availability, Restriction, NuyenCost, MinRating, MaxRating)
VALUES
-- Core Book 
-- Melee Weapons

-- Blades
('MeleeWeapon', 'Combat Axe', 8, 'R', 600, null, null),
('MeleeWeapon', 'Forearm Snap-Blades', 6, 'R', 150, null, null),
('MeleeWeapon', 'Katana', 4, 'R', 1000, null, null),
('MeleeWeapon', 'Knife', null, null, 20, null, null),
('MeleeWeapon', 'Monofilament Sword', 8, 'R', 750, null, null),
('MeleeWeapon', 'Survival Knife', null, null, 50, null, null),
('MeleeWeapon', 'Sword', 4, 'R', 350, null, null),

-- Clubs
('MeleeWeapon', 'Club', null, null, 30, null, null),
('MeleeWeapon', 'Extendable Baton', null, null, 50, null, null),
('MeleeWeapon', 'Sap', null, null, 30, null, null),
('MeleeWeapon', 'Staff', null, null, 50, null, null),
('MeleeWeapon', 'Stun Baton', 4, 'R', 400, null, null),

-- Exotic
('MeleeWeapon', 'Monofilament Whip', 12, 'F', 3000, null, null),
('MeleeWeapon', 'Pole Arm', 4, 'R', 1000, null, null),

-- Unarmed
('MeleeWeapon', 'Shock Glove', 3, 'R', 200, null, null),

-- Projectile weapons
('ProjectileWeapon', 'Bow', 2, null, 100, null, null), -- Rating
('ProjectileWeapon', 'Light Crossbow', 2, null, 300, null, null),
('ProjectileWeapon', 'Medium Crossbow', 4, 'R', 500, null, null),
('ProjectileWeapon', 'Heavy Crossbow', 8, 'R', 750, null, null),

-- Thrown weapons
('ProjectileWeapon', 'Shuriken', 2, null, 30, null, null),
('ProjectileWeapon', 'Throwing Knife', 2, null, 20, null, null),

-- Tasers
('Firearms', 'Defiance EX Shocker', null, null, 150, null, null),
('Firearms', 'Yamaha Pulsar', null, null, 150, null, null),

-- Hold-out
('Firearms', 'Raecor Sting', 6, 'R', 350, null, null),
('Firearms', 'Streetline Special', 4, 'R', 100, null, null),

-- Light Pistols
('Firearms', 'Colt America L36', 4, 'R', 150, null, null),
('Firearms', 'Fichetti Security 600', 6, 'R', 450, null, null),
('Firearms', 'Hammerli 620S', 8, 'R', 650, null, null),
('Firearms', 'Yamaha Sakura Fubuki', 10, 'R', 2000, null, null),

-- Heavy Pistols
('Firearms', 'Ares Predator IV', 4, 'R', 350, null, null),
('Firearms', 'Ares Viper Slivergun', 5, 'R', 500, null, null),
('Firearms', 'Colt Manhunter', 4, 'R', 300, null, null),
('Firearms', 'Remington Roomsweeper', 6, 'R', 250, null, null),
('Firearms', 'Ruger Super Warhawk', 3, 'R', 250, null, null),

-- Machine Pistols
('Firearms', 'Ceska Black Scorpion', 3, 'R', 250, null, null),
('Firearms', 'Steyr TMP', 8, 'R', 600, null, null),

-- Submachine Guns
('Firearms', 'AK-97 Carbine', 4, 'R', 400, null, null),
('Firearms', 'HK-227X', 8, 'R', 800, null, null),
('Firearms', 'HK MP-5 TX', 4, 'R', 550, null, null),
('Firearms', 'Ingram Smartgun X', 6, 'R', 650, null, null),
('Firearms', 'Uzi IV', 4, 'R', 500, null, null),

-- Assault Rifles
('Firearms', 'AK-97', 4, 'R', 500, null, null),
('Firearms', 'Ares Alpha', 12, 'F', 1700, null, null),
('Firearms', 'FN HAR', 8, 'R', 1000, null, null),
('Firearms', 'HK XM30', 15, 'F', 2500, null, null),
('Firearms', 'HK XM30 Shotgun Module', null, null, 1000, null, null),
('Firearms', 'HK XM30 Carbine Module', null, null, 500, null, null),
('Firearms', 'HK XM30 Sniper Module', null, null, 1000, null, null),
('Firearms', 'HK XM30 LMG Module', null, null, 1000, null, null),

-- Sport Rifles
('Firearms', 'Ruger 100', 4, 'R', 900, null, null),
('Firearms', 'PJSS Elephant Rifle', 12, 'R', 6000, null, null),

-- Sniper Rifles
('Firearms', 'Ranger Arms SM-4', 16, 'F', 6200, null, null),
('Firearms', 'Walter MA-2100', 10, 'F', 5000, null, null),

-- Shotguns
('Firearms', 'Mossberg AM-CMDT', 12, 'R', 1000, null, null),
('Firearms', 'Remington 990', 4, 'R', 550, null, null),

-- Special Weapons
('Firearms', 'Ares S-III Super Squirt', 4, null, 500, null, null),
('Firearms', 'Fichetti Pain Inducer', 8, 'R', 2000, null, null),
('Firearms', 'Parashield Dart Pistol', 6, 'R', 600, null, null),
('Firearms', 'Parashield Dart Rifle', 6, 'R', 1700, null, null),

-- LMG
('Firearms', 'Ingram White Knight', 12, 'F', 2000, null, null),

-- MMG
('Firearms', 'Stoner-Ares M202', 12, 'F', 4500, null, null),

-- HMG
('Firearms', 'Ultimax HMG-2', 15, 'F', 7500, null, null),

-- Assault Cannons
('Firearms', 'Panther XXL', 20, 'F', 5500, null, null),

-- Grenade Launchers
('Firearms', 'Ares Antioch-2', 8, 'F', 600, null, null),
('Firearms', 'ArmTech MGL-12', 10, 'F', 2000, null, null),

-- Missile Launchers
('Firearms', 'Aztechnology Striker', 10, 'F', 1000, null, null),
('Firearms', 'Mitsubishi Yakusoku MRL', 20, 'F', 12000, null, null), 

-- Ammunition
('Ammunition', 'APDS', 16, 'F', 70, null, null),
('Ammunition', 'Assault Cannon', 16, 'F', 450, null, null),
('Ammunition', 'Explosive Rounds', 8, 'F', 50, null, null),
('Ammunition', 'EX-Explosive Rounds', 12, 'F', 100, null, null),
('Ammunition', 'Flechette Rounds', 2, 'R', 100, null, null),
('Ammunition', 'Gel Rounds', 4, 'R', 30, null, null),
('Ammunition', 'Injection Darts', 4, 'R', 75, null, null),
('Ammunition', 'Regular Ammo', 2, 'R', 20, null, null),
('Ammunition', 'Stick-n-Shock', 5, 'R', 80, null, null),
('Ammunition', 'Tracer', 5, 'R', 75, null, null),
('Ammunition', 'Taser Dart', 2, null, 50, null, null),
('Ammunition', 'Arrow', 2, null, 5, null, null),
('Ammunition', 'Injection Arrow', 8, 'R', 50, null, null),
('Ammunition', 'Crossbow Bolt', 2, null, 5, null, null),
('Ammunition', 'Injection Bolt', 8, 'R', 50, null, null),

('FirearmAccessory', 'Airburst Link', 6, 'R', 500, null, null),
('FirearmAccessory', 'Bipod', 2, null, 100, null, null),
('FirearmAccessory', 'Concealable Holster', 2, null, 75, null, null),
('FirearmAccessory', 'Gas-Vent 2 System', 4, 'R', 200, null, null),
('FirearmAccessory', 'Gas-Vent 3 System', 6, 'R', 400, null, null),
('FirearmAccessory', 'Gyro Stabilization', 7, null, 3000, null, null),
('FirearmAccessory', 'Hidden Gun Arm Slide', 4, null, 350, null, null),
('FirearmAccessory', 'Imaging Scope', 3, null, 300, null, null),
('FirearmAccessory', 'Laser Sight', 2, null, 100, null, null),
('FirearmAccessory', 'Periscope', 3, null, 50, null, null),
('FirearmAccessory', 'Quick-Draw Holster', 4, null, 100, null, null),
('FirearmAccessory', 'Shock Pad', 2, null, 50, null, null),
('FirearmAccessory', 'Silencer', 8, 'F', 200, null, null),
('FirearmAccessory', 'Smart Firing Platform', 12, 'F', 2000, null, null),
('FirearmAccessory', 'Smartgun System, internal', 6, 'R', 0, null, null), -- Weapon Cost
('FirearmAccessory', 'Smartgun System, external', 4, 'R', 400, null, null),
('FirearmAccessory', 'Sound Suppresser', 12, 'F', 300, null, null),
('FirearmAccessory', 'Spare Clips', 4, null, 5, null, null),
('FirearmAccessory', 'Speed Loader', 2, null, 25, null, null),
('FirearmAccessory', 'Tripod', 4, null, 300, null, null),

('Grenade', 'Flash-Bang Grenade', 6, 'R', 30, null, null),
('Grenade', 'Flash-Pak', 4, null, 200, null, null),
('Grenade', 'Fragmentation Grenade', 10, 'F', 35, null, null),
('Grenade', 'High Explosive Grenade', 7, 'F', 45, null, null),
('Grenade', 'Gas Grenade', 4, null, 20, null, null),
('Grenade', 'Smoke Grenade', 4, 'R', 30, null, null),
('Grenade', 'Thermal Smoke Grenade', 6, 'R', 35, null, null),

('Grenade', 'Anti-Vehicle Rocket', 20, 'F', 1000, null, null),
('Grenade', 'Fragmentation Rocket', 16, 'F', 500, null, null),
('Grenade', 'High Explosive Rocket', 20, 'F', 750, null, null),

('Explosive', 'Commercial Explosive', 8, 'R', 100, null, null),
('Explosive', 'Foam Explosive', 12, 'F', 100, null, null),
('Explosive', 'Plastic Explosive', 16, 'F', 100, null, null),

('ExplosiveAccessories', 'Detonator Cap', 8, 'R', 75, null, null),

('Armour', 'Leather Jacket', null, null, 200, null, null),
('Armour', 'Feedback Clothing', 8, null, 500, null, null),
('Armour', 'Actioneer Business Clothes', 8, null, 1500, null, null),
('Armour', 'Armor Clothing', 2, null, 500, null, null),
('Armour', 'Armor Jacket', 2, null, 900, null, null),
('Armour', 'Armor Vest', 4, null, 600, null, null),
('Armour', 'Camouflage Suit', 4, null, 1200, null, null),
('Armour', 'Chameleon Suit', 10, 'R', 8000, null, null),
('Armour', 'Full Body Armor', 14, 'R', 6000, null, null),
('ArmourExtra', 'Full Body Helmet', null, null, 1000, null, null),
('ArmourExtra', 'Full Body Chemical Seal', 6, null, 5000, null, null),
('ArmourExtra', 'Full Body Environment Adaptation', 3, null, 2000, null, null),
('Armour', 'Lined Coat', 2, null, 700, null, null),
('Armour', 'Urban Explorer Jumpsuit', 8, null, 500, null, null),
('ArmourExtra', 'Urban Explorer Helmet', null, null, 50, null, null),
('Armour', 'Helmet', 2, null, 100, null, null),
('Armour', 'Ballistic Shield', 12, 'R', 1500, null, null),
('Armour', 'Riot Shield', 6, 'R', 200, null, null),
('Armour', 'Taser Shield', 10, 'R', 750, null, null),

-- Armour modifications still missing!

('Commlink', 'Meta Link', null, null, 100, null, null),
('Commlink', 'CMT Clip', null, null, 300, null, null),
('Commlink', 'Sony Emperor', null, null, 700, null, null),
('Commlink', 'Renraku Sensei', null, null, 1000, null, null),
('Commlink', 'Novatech Airware', null, null, 1250, null, null),
('Commlink', 'Erika Elite', null, null, 2500, null, null),
('Commlink', 'Hermes Ikon', null, null, 3000, null, null),
('Commlink', 'Transys Avalon', null, null, 5000, null, null),
('Commlink', 'Fairlight Caliban', null, null, 8000, null, null),

('OS', 'Vector Xim', null, null, 200, null, null),
('OS', 'Redcap Nix', null, null, 400, null, null),
('OS', 'Renraku Ichi', null, null, 600, null, null),
('OS', 'Mangadyne Deva', null, null, 800, null, null),
('OS', 'Iris Orb', null, null, 1000, null, null),
('OS', 'Novatech Navi', null, null, 1500, null, null)
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
('Sword', 1, '(STR/2 + 3) P', null),

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
('Ultimax HMG-2', '7P', '-3', 'FA', '3 (10)', '50 (c) or 100 (belt)'),

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

insert into CyberwareGrades
(Grade, EssenceMultiplier, CostMultiplier)
values
('Standard', 1.0, 1.0),
('Alphaware', 0.8, 2.0),
('Betaware', 0.7, 4.0),
('Deltaware', 0.5, 10.0)
;

insert into Programmes
(Name, ProgType, Skill, Description)
values
-- Common Use programs
('Analyze', 'Common Use', 'Computer', 'Gather data about icons and nodes in the Matrix. Used for Matrix Perception. Can help detect hacking attempts if running in a node.'),
('Browse', 'Common Use', 'Data Search', 'Track down information on a particular node or in the Matrix at large. Use for Data Search actions'),
('Command', 'Common Use', null, 'Gives the user a modular and customizable control interface for various devices; used to control a device through the Matrix'),
('Edit', 'Common Use', 'Computer', 'Creates and alters files of any media type; use with the Edit action'),
('Encrypt', 'Common Use', 'Electronic Warfare', 'Secures files, nodes and communications by using various cryptographic schemes and ciphers'),
('Reality Filter', 'Common Use', 'Response', 'Translates a node''s VR sculpting into a metaphor of the user''s choice'),
('Scan', 'Common Use', 'Electronic Warfare', 'Allows the user to locate wireless networks; use for the Detect Hidden Node action'),
-- Hacking programs
('Armor', 'Hacking', null, 'Protects icons from attacks that cause Matrix damage'),
('Attack', 'Hacking', null, 'Used to crash another icon or program. Use with Cybercombat or Hacking skill'),
('Biofeedback Filter', 'Hacking', null, 'Monitors simsense signals and filters harmful feedback'),
('Black Hammer', 'Hacking', 'Cybercombat', 'Black IC program that injects dangerous biofeedback responses into the target''s simsense interface'),
('Blackout', 'Hacking', 'Cybercombat', 'Black IC program that is a nonlethal version of Black Hammer'),
('Data Bomb', 'Hacking', null, 'Creates a data bomb in a file or node that attempts to crash an icon trying to access the file or node without authorization'),
('Decrypt', 'Hacking', 'Electronic Warfare', 'Breaks into an encrypted system or service'),
('Defuse', 'Hacking', 'Hacking', 'Deactivates data bombs'),
('ECCM', 'Hacking', null, 'Filters out jamming signals that attempt to disrupt a wireless connection'), 
('Exploit', 'Hacking', 'Hacking', 'Takes advantage of security weaknesses so a hacker can get unauthorized access to a node or program'),
('Medic', 'Hacking', 'Computer', 'Repairs Matrix damage inflicted on icons'),
('Sniffer', 'Hacking', null, 'Gathers data traffic and wireless signals and captures the information. Use with Electronic Warfare or Hacking skill'),
('Spoof', 'Hacking', 'Hacking', 'Generates false access IDs and forges misleading data packets to confuse Track programs'),
('Stealth', 'Hacking', 'Hacking', 'Attempts to hide the hacker from other system processes'),
-- Autosofts
('Track', 'Hacking', 'Computer', 'Analyzes a user''s connection and follows the datatrail back to the originating node'),
('Clearsight', 'Autosoft', null,  'Improve the Pilot''s cognitive abilities, allowing it to better analyze and judge sensory input'),
('Defense', 'Autosoft', null,  'Enables the drone to identify, guard against and dodge physical attacks'),
('Electronic Warfare', 'Autosoft', null,  'Provides the drone with an in-depth knowledge of radio communications and the use of electronic warfare against them'),
('Maneuver (Ground vehicle)', 'Autosoft', null,  'Helps a pilot maneuver ground vehicles'),
('Maneuver (Anthroform)', 'Autosoft', null,  'Helps a pilot maneuver anthroform vehicles'),
('Maneuver (Aircraft)', 'Autosoft', null,  'Helps a pilot maneuver aircraft within the atmosphere'),
('Maneuver (Aerospace)', 'Autosoft', null,  'Helps a pilot maneuver aircraft outside the atmosphere'),
('Maneuver (Watercraft)', 'Autosoft', null,  'Helps a pilot maneuver watercraft'),
('Targeting (Archery)', 'Autosoft', null,  'Mimics the Archery attack skill'),
('Targeting (Automatics)', 'Autosoft', null,  'Mimics the Automatics attack skill'),
('Targeting (Blades)', 'Autosoft', null,  'Mimics the Blades attack skill'),
('Targeting (Clubs)', 'Autosoft', null,  'Mimics the Clubs attack skill'),
('Targeting (Heavy Weapons)', 'Autosoft', null,  'Mimics the Heavy Weapons attack skill'),
('Targeting (Longarms)', 'Autosoft', null,  'Mimics the Longarms attack skill'),
('Targeting (Pistols)', 'Autosoft', null,  'Mimics the Pistols attack skill'),
('Targeting (Throwing Weapons)', 'Autosoft', null,  'Mimics the Throwing Weapons attack skill'),
('Targeting (Unarmed Combat)', 'Autosoft', null,  'Mimics the Unarmed Combat attack skill'),
-- Linguasofts
('English', 'Linguasoft', null, ''),
('Spanish', 'Linguasoft', null, ''),
('French', 'Linguasoft', null, ''),
('Japanese', 'Linguasoft', null, ''),
('Cantonese', 'Linguasoft', null, ''),
('Mandarin', 'Linguasoft', null, ''),
('German', 'Linguasoft', null, ''),
('Arabic', 'Linguasoft', null, ''),
('Turkish', 'Linguasoft', null, ''),
('Or''zet', 'Linguasoft', null, ''),
('Sperethiel', 'Linguasoft', null, '');

insert into Cyberware
(
Name,
Essence,
CapacityRating
)
values
('Commlink', 0.2, -2),
('Control Rig', 0.5, -2),
('Cranial Bomb (Kink)', 0, -1),
('Cranial Bomb (Microbomb)', 0, -2),
('Cranial Bomb (Area Bomb)', 0, -3),
('Datajack', 0.1, -1),
('Data Lock', 0.1, -1),
('Olfactory Booster', 0.2, -2),
('Sim Module', 0.2, -2),
('Sim Module (Hot-Sim modified)', 0.2, -2),
('Taste Booster', 0.2, null),
('Tooth Storage Compartment', 0, null),
('Tooth Breakable Compartment', 0, null),
('Ultrasound Sensor', 0.3, -2),
('Voice Modulator', 0.2, null),
-- Eyeware (Core Book p 341)
('Cybereyes Basic System (Rating 1)', 0.2, 4),
('Cybereyes Basic System (Rating 2)', 0.3, 8),
('Cybereyes Basic System (Rating 3)', 0.4, 12),
('Cybereyes Basic System (Rating 4)', 0.5, 16),
('Eye Recording Unit', 0.1, 0),
('Flare Compensation', 0.1, -1),
('Image Link', 0.1, 4),
('Low-light Vision', 0.1, 2),
('Ocular Drone', null, -6),
('Protective Covers', null, null),
('Retinal Duplication', 0.1, -1),
('Smartlink', 0.1, -3),
('Thermographic Vision', 0.1, -2),
('Vision Enhancement (Rating 1)', 0.1, -1),
('Vision Enhancement (Rating 2)', 0.1, -2),
('Vision Enhancement (Rating 3)', 0.1, -3),
('Vision Magnification', 0.1, -2),
-- Earware (Core Book p 341)
('Cyberears (Rating 1)', 0.2, 4),
('Cyberears (Rating 2)', 0.3, 8),
('Cyberears (Rating 3)', 0.4, 12),
('Cyberears (Rating 4)', 0.5, 16),
('Audio Enhancement (Rating 1)', 0.1, -1),
('Audio Enhancement (Rating 2)', 0.1, -2),
('Audio Enhancement (Rating 3)', 0.1, -3),
('Balance Augmenter', 0.1, -4),
('Damper', 0.1, -1),
('Ear Recording Unit', 0.1, null), -- included in the basic system
('Select Sound Filter (Rating 1)', 0.1, -1),
('Select Sound Filter (Rating 2)', 0.1, -2),
('Select Sound Filter (Rating 3)', 0.1, -3),
('Select Sound Filter (Rating 4)', 0.1, -4),
('Select Sound Filter (Rating 5)', 0.1, -5),
('Select Sound Filter (Rating 6)', 0.1, -6),
('Sound Link', 0.1, null), -- included
('Spatial Recognizer', 0.1, -2),
-- Bodyware (Core Book p. 342)
('Bone Lacing (Plastic)', 0.5, null),
('Bone Lacing (Aluminum)', 1.0, null),
('Bone Lacing (Titanium)', 1.5, null),
('Dermal Plating (Rating 1)', 0.5, null),
('Dermal Plating (Rating 2)', 1, null),
('Dermal Plating (Rating 3)', 1.5, null),
('Fingertip Compartment', 0.1, -1),
('Grapple Gun', 0.5, -5),
('Internal Air Tank', 0.25, 3),
('Muscle Replacement (Rating 1)', 1, null),
('Muscle Replacement (Rating 2)', 2, null),
('Muscle Replacement (Rating 3)', 3, null),
('Muscle Replacement (Rating 4)', 4, null),
('Reaction Enhancers (Rating 1)', 0.3, null),
('Obvious Cyberarm', 1, 15),
('Obvious Cyberleg', 1, 20),
('Obvious Hand', 0.25, 4),
('Obvious Foot', 0.25, 3),
('Obvious Lower Arm', 0.45, 10),
('Obvious Lower Leg', 0.45, 12);

insert into Sprites
(
SpriteType, 
PilotModifier,
ResponseModifier,
FirewallModifier,
MatrixInitModifier,
IP,
EdgeModifier,
Description
)
values
('Courier', 0, 1, 1, 3, 3, 0, 'Messengers and trackers, good for securely conveying important data through the matrix'),
('Crack', 0, 1, 0, 3, 3, 0, 'Masters at finding programming flaws and exploits'),
('Data', 0, 0, -2, 2, 3, 0, 'Excel at finding and manipulating information'),
('Fault', 0, 2, 1, 3, 3, 0, 'Designed to inject code errors and cause programs to fail'),
('Machine', 0, 0, 2, 2, 3, 0, 'Adept at manipulating devices');


insert into SpriteSkills
(SpriteType, Skill)
values
('Courier', 'Computer'),
('Courier', 'Data Search'),
('Courier', 'Hacking'),
('Crack', 'Computer'),
('Crack', 'Electronic Warfare'),
('Crack', 'Hacking'),
('Data', 'Computer'),
('Data', 'Data Search'),
('Data', 'Electronic Warfare'),
('Fault', 'Computer'),
('Fault', 'Cybercombat'),
('Fault', 'Hacking'),
('Machine', 'Computer'),
('Machine', 'Electronic Warfare'),
('Machine', 'Hardware');

insert into SpriteComplexForms
(SpriteType,
ComplexForm,
Optional
)
values
('Courier', 'Analyze', 0),
('Courier', 'Edit', 0),
('Courier', 'Encrypt', 0),
('Courier', 'Stealth', 0),
('Courier', 'Track', 0),
('Courier', 'Browse', 1),
('Courier', 'Command', 1),
('Courier', 'Decrypt', 1),
('Courier', 'Exploit', 1),
('Courier', 'Scan', 1),
('Crack', 'Analyze', 0),
('Crack', 'Exploit', 0),
('Crack', 'Stealth', 0),
('Crack', 'Decrypt', 1),
('Crack', 'Defuse', 1),
('Crack', 'Edit', 1),
('Crack', 'Scan', 1),
('Crack', 'Spoof', 1),
('Data', 'Analyze', 0),
('Data', 'Browse', 0),
('Data', 'Edit', 0),
('Data', 'Decrypt', 0),
('Data', 'Defuse', 1),
('Data', 'Encrypt', 1),
('Data', 'Sniffer', 1),
('Data', 'Stealth', 1),
-- ('Data', 'any linguasoft', 1),
('Fault', 'Analyze', 0),
('Fault', 'Armor', 0),
('Fault', 'Attack', 0),
('Fault', 'Stealth', 0),
('Fault', 'Black Hammer', 1),
('Fault', 'Blackout', 1),
('Fault', 'Exploit', 1),
('Fault', 'Medic', 1),
('Machine', 'Analyze', 0),
('Machine', 'Command', 0),
('Machine', 'Decrypt', 1),
('Machine', 'Edit', 1),
('Machine', 'Medic', 1)
-- ,('Machine', 'any autosoft', 1)
;

insert into SpritePowers
(SpriteType,
SpritePower,
Description
)
values
('Courier', 'Cookie', 'Tag a target icon with a hidden piece of code that can be used to track the icon''s Matrix activities'),
('Courier', 'Hash', 'Temporarily encrypt a file with a unique Resonance algorithm such that only the sprite can decrypt it'),
('Crack', 'Suppression', 'Confuse firewalls that detect the sprite engaging in illegitimate activity'),
('Data', 'Steganography', 'Conceal a file or piece of data within another file'),
('Data', 'Watermark', 'Tag an icon or node with an invisible marking that only Resonance-driven entities can see; secretly leave messages or otherwise mark Matrix object'),
('Fault', 'Electron Storm', 'Engulfs a target icon in a sustained barrage of corrupting signals'),
('Machine', 'Diagnostics', 'Evaluates the inner workings of an electronic device'),
('Machine', 'Gremlins', 'Causes a device to mysteriously malfunction'),
('Machine', 'Stability', 'Prevents normal malfunctions or accidents from afflicting the target');

insert into Echoes
(
Name,
Multiple,
MaxAmount,
Description
)
values
('Firewall Upgrade', 1, 3, 'Firewall rating of living persona increases by 1'),
('NeuroFilter', 1, 3, 'Biofeedback Filter rating of living persona increases by 1'),
('Overclocking', 0, null, 'Accelerate living persona''s system clock, granting the technomancer +1 to Response and an additional Initiative Pass in full-sim VR'),
('Resonance Link', 0, null, 'Establishes a low-level, one-way empathic link with another technomancer of the character''s choice'),
('System Upgrade', 1, 3, 'System rating of living persona increases by 1');

insert into EchoReferences
(
Echo,
Title,
Page
)
values
('Firewall Upgrade', '20th Anniversary Core Rulebook', 243),
('NeuroFilter', '20th Anniversary Core Rulebook', 243),
('Overclocking', '20th Anniversary Core Rulebook', 244),
('Resonance Link', '20th Anniversary Core Rulebook', 244),
('System Upgrade', '20th Anniversary Core Rulebook', 244);