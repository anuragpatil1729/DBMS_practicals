// ==========================================================
// ASSIGNMENT NO: 10
// Aim: MapReduce in MongoDB
// Problem Statement:
// Implement MapReduce operation to process and
// summarize large datasets.
// ==========================================================


// 1. Show Databases
// show dbs is used to display all databases.
show dbs;


// 2. Create / Switch Database
// use command is used to create or switch database.
use staffDB;


// 3. Create Collection
// createCollection is used to create a new collection.
db.createCollection("Staff");


// 4. Insert Documents
// insertMany is used to insert multiple documents.
db.Staff.insertMany([
    { name: "Anurag", age: 25, address: "Pune" },
    { name: "Rahul", age: 30, address: "Mumbai" },
    { name: "Anurag", age: 28, address: "Delhi" },
    { name: "Sneha", age: 22, address: "Pune" },
    { name: "Rahul", age: 35, address: "Chennai" }
]);


// ==========================================================
// MAP REDUCE OPERATIONS
// ==========================================================


// 5. Define Map Function
// Map function emits key-value pairs.
var mapFunction = function() {
    emit(this.name, this.age);
};


// 6. Define Reduce Function
// Reduce function aggregates values for each key.
var reduceFunction = function(key, values) {
    return Array.sum(values);
};


// 7. Execute MapReduce
// mapReduce processes data and stores result in new collection.
db.Staff.mapReduce(
    mapFunction,
    reduceFunction,
    {
        out: "staff_age_sum"
    }
);


// 8. Display Result
// find() is used to display MapReduce output.
db.staff_age_sum.find();
