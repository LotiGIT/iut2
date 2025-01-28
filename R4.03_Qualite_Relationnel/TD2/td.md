# Exercice 1 


+---+---+---+---+
| A | B | C | D |
+---+---+---+---+
| a1| b1| c1| d1|
| a1|   | c1| d2|
| a1| b1|   | d3|
| a2| b2| c2| d4|
| a2| b2|   | d5|
+---+---+---+---+

**avec A → B ; B → C ; A, B → C cela donne :** 


+---+---+---+---+
| A | B | C | D |
+---+---+---+---+
| a1| b1| c1| d1|
| a1| b1| c1| d2|
| a1| b1| c1| d3|
| a2| b2| c2| d4|
| a2| b2| c2| d5|
+---+---+---+---+

# Exercice 2


**Pokemon :**

| NumPokemon |    Nom    | Type | Niveau | Attaque | PV |  Dresseur  |
|------------|-----------|------|--------|---------|----|------------|
|    001     | Bulbasaur | Grass|   10   | Tackle  | 45 | Ash Ketchum|
|    002     | Charmander| Fire |    8   |  Ember  | 39 |  Gary Oak  |
|    003     | Squirtle  | Water|    9   |Water Gun| 44 |    Misty   |

## 1

NumPokemon → Nom, Type, Niveau, Attaque, PV, Dresseur
Nom → Type, Attaque, PV
Niveau → Dresseur, Nom
Type → Nom

## 2

{NumPokémon}⁺   = {NumPokémon}⁺ . {NumPokémon} = {NumPokémon}⁺{NumPokémon, nom}
                = {NumPokémon}⁺{NumPokémon, Nom, Type} = 

## 3

# Exercice 3


+-----------+----------+-------+--------------+-------+--------------+------------------+
| Name | Type | Level | Move | Power | Trainer | Location |
+-----------+----------+-------+--------------+-------+--------------+------------------+
| Pikachu | Electric | 12 | Thunder Shock| 40 | Ash Ketchum | Viridian Forest |
| Jigglypuff| Normal | 15 | Sing | 50 | Misty | Mt. Moon |
| Geodude | Rock | 10 | Rock Throw | 30 | Brock | Mt. Moon |
| Vulpix | Fire | 8 | Ember | 35 | Gary Oak | Cerulean City |
| Machop | Fighting | 14 | Karate Chop | 45 | Bruno | Victory Road |
| Abra | Psychic | 5 | Teleport | 20 | Sabrina | Saffron City |
| Sandshrew | Ground | 11 | Scratch | 40 | Lt. Surge | Digletts Cave |
| Oddish | Grass | 9 | Absorb | 35 | Erika | Celadon City |
| Clefairy | Fairy | 13 | Metronome | 48 | Cynthia | Cerulean Cave |
| Nidoran | Poison | 7 | Poison Sting | 25 | Brock | Pewter City |
+-----------+----------+-------+--------------+-------+--------------+------------------+


```sql
SELECT Name
FROM Pokemon
GROUP BY Name
HAVING COUNT(DISTINCT Type) > 1;

SELECT Name, Type
FROM Pokemon
GROUP BY Name, Type
HAVING COUNT(Name) = 1;


```