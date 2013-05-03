insert into Characters
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