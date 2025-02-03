# Part 4 - DML QUERYING

### 1. All fields of games

d.games.find({})

### 2. Games id

db.games.find({}, {id:true})

### 3. Titles and descriptions

db.games.find({}, {title:true, description:true})

### 4. Titles

db.games.find({}, {title})

### 5. Distinct titles

db.games.distinct("title")

### 6. Years of release

db.games.find({}, {release_temp:true})
db.games.aggregate(
    [
        {
            $project:{
                year:{$year:"release_temp"}
            }
        }
    ]
)

### 7. Games with a id less than 1000

db.games.find({id:{ $lt: 1000 }})

### 8. Games in 2000 and id greater than 48000.

db.games.find($and:
    [
        {id:{$gt:48000}}, 
        {release_temp:{$lt:new DATE(2000-12-31)}},
        {release_temp:{$gt:new DATE(2000-01-01)}}
    ] 
)

### 9. Games titles with a id less than 1000.

db.student.aggregate(
    [
        { $games_titles : { id :{$lt: 1000} } }
    ]
)

### 10. Games sorted by title.

db.games.aggregate([
    {
        $sort : {title : 1}
    }
])

### 11. Number of games per year.*
### 12. Number of games per year with at least 3 games.*
### 13. Games which title ends by 2.*
### 14. Games which id is between 1000 and 2000.