# Part 4 - DML QUERYING

## TP - 4.1

### 1. All fields of game

db.game.find()

### 2. game id

db.game.find({}, {id:true})

### 3. Titles and cover

db.game.find({}, {title:true, cover:true})

### 4. Titles

db.game.find({}, {title:true})

### 5. Distinct titles

db.game.distinct("title")

### 6. Years of release

db.game.aggregate([{$project:{year:{$year:"rel"}}}])

### 7. game with a id less than 1000

db.game.find({id:{ $lt: 1000 }})

### 8. game in 2000 and id greater than 48000

db.game.find({
        $and: [
            {id: {$gt: 48000}},
            {rel: {$lt: new Date("2000-12-31")}},
            {rel: {$gt: new Date("2000-01-01")}}
        ]
    })

### 9. game titles with a id less than 1000

db.game.aggregate([{$match:{id: { $lt: 1000 }}},{$project:{title: 1}}])

### 10. game sorted by title

db.game.aggregate([{$sort : {title : 1}}])

### 11. Number of game per year

#### 1.1 Conversion d champ rel String en une DATE

db.game.updateMany(
    { rel: { $type: "string" } },  // Filtrer uniquement les champs qui sont des strings
    [
        {
            $set: {
                rel: {
                    $dateFromString: {
                        dateString: "$rel"
                    }
                }
            }
        }
    ]
)

#### 1.2 Faire la requête avec rel étant une date

db.game.aggregate([{$project: {year: { $year: "$rel" }}},{$group: {_id: "$year",count: { $sum: 1 }}},{$sort: { _id: 1 }}])

### 12. Number of game per year with at least 3 game

db.game.aggregate([ { $project: {     year: { $year: "$rel" } } }, { $group: { _id: "$year",count: { $sum: 1 } } }, { $match: {count: { $gte: 3 } } }, { $sort: { _id: 1 } } ])

### 13. game which title ends by 2

db.game.find({title: { $regex: "2$", $options: "i" }})

### 14. game which id is between 1000 and 2000

db.game.find({
        $and:[
            {id: {$gte:1000}},
            {id: {$lt:2001}}
        ]
    })

## TP - 4.2

### 2. Insert in collection people 2 documents (id, name, age): (1, 'Alice', 20), (2, 'Bob', 35)

db.toto.insertMany([{id:1, name:"Alice", age:20}, {id:2, name:"Bob", age:35}])

### 3. Display all databases

show dbs

### 4. Display the current DB

db

### 5. Delete collection people

db.people.drop()
