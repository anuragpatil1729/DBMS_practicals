// ==========================================================
// ASSIGNMENT NO: 9
// Aim: Aggregation and Indexing in MongoDB
// Problem Statement:
// Implement aggregation and indexing with suitable examples.
// ==========================================================


// 1. Show Databases
// show dbs command is used to display all databases.
show dbs;


// 2. Create / Switch Database
// use command is used to create or switch database.
use productDB;


// 3. Create Collection
// createCollection is used to create a new collection.
db.createCollection("Product");


// 4. Insert Documents
// insertMany inserts multiple documents into collection.
db.Product.insertMany([
    { name: "Laptop", company: "Dell", cost: 60000 },
    { name: "Phone", company: "Samsung", cost: 30000 },
    { name: "Tablet", company: "Apple", cost: 50000 },
    { name: "Monitor", company: "Dell", cost: 15000 },
    { name: "Phone", company: "Apple", cost: 70000 }
]);


// ==========================================================
// AGGREGATION OPERATIONS
// ==========================================================


// 5. Aggregation using $group (Min & Max Price)
// $group is used to group documents by a field.
db.Product.aggregate([
    {
        $group: {
            _id: "$company",
            minPrice: { $min: "$cost" },
            maxPrice: { $max: "$cost" }
        }
    }
]);


// 6. Aggregation with Sorting
// $sort is used to arrange grouped output.
db.Product.aggregate([
    {
        $group: {
            _id: "$company",
            minPrice: { $min: "$cost" },
            maxPrice: { $max: "$cost" }
        }
    },
    { $sort: { _id: 1 } }
]);


// 7. Count Documents
// countDocuments returns total number of documents.
db.Product.countDocuments();


// 8. Distinct Values
// distinct returns unique values of a field.
db.Product.distinct("company");


// 9. Count Products per Company
// $sum is used to count number of documents.
db.Product.aggregate([
    {
        $group: {
            _id: "$company",
            count: { $sum: 1 }
        }
    }
]);


// 10. Limit Documents
// limit restricts number of documents returned.
db.Product.find().limit(1);


// 11. Skip Documents
// skip is used to skip specific number of records.
db.Product.find().skip(2);



// ==========================================================
// INDEXING OPERATIONS
// ==========================================================


// 12. Insert Data into staff Collection
// insertOne inside loop inserts multiple records.
for (let i = 1; i <= 10; i++) {
    db.staff.insertOne({
        Staff_id: i,
        staff_name: "Staff" + i,
        age: 20 + i
    });
}


// 13. Query without Index (Performance Check)
// explain shows execution statistics.
db.staff.find({ Staff_id: 2 }).explain("executionStats");


// 14. Create Index
// createIndex improves query performance.
db.staff.createIndex({ staff_name: 1 });


// 15. Query using Index
db.staff.find({ age: 40, staff_name: "Karan" }).explain("executionStats");


// 16. Create Compound Index
db.staff.createIndex({ age: 1, staff_name: 1 });


// 17. Drop Index
// dropIndex removes index from collection.
db.staff.dropIndex({ age: 1, staff_name: 1 });


// 18. Drop Single Index
db.staff.dropIndex({ staff_name: 1 });


// 19. Create Unique Index
// unique index ensures no duplicate values.
db.staff.createIndex({ staff_name: 1 }, { unique: true });
