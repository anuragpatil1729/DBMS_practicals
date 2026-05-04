// ==========================================================
// ASSIGNMENT NO: 8
// Aim: MongoDB CRUD Operations
// Problem Statement:
// Design and develop MongoDB queries using CRUD operations,
// logical operators, update and delete commands.
// ==========================================================


// 1. Show Existing Databases
// show dbs command is used to display available databases.
show dbs;


// 2. Create / Switch Database
// use command is used to create or switch to a database.
use companyDB;


// 3. Create Collection
// createCollection is used to create a new collection.
db.createCollection("Employee");


// 4. Insert Documents
// insertMany is used to insert multiple documents.
db.Employee.insertMany([
{
    Employee_Id: 7369,
    Lastname: "Smith",
    Firstname: "Jon",
    Middlename: "Q",
    Job_Id: 667,
    Manager_id: 7902,
    Hiredate: new Date("1984-12-17"),
    Salary: 800,
    Department_id: 10
},
{
    Employee_Id: 7499,
    Lastname: "Allen",
    Firstname: "Kevin",
    Middlename: "J",
    Job_Id: 670,
    Manager_id: 7698,
    Hiredate: new Date("1985-02-20"),
    Salary: 1600,
    Department_id: 20
},
{
    Employee_Id: 7505,
    Lastname: "Doyle",
    Firstname: "Jean",
    Middlename: "K",
    Job_Id: 671,
    Manager_id: 7839,
    Hiredate: new Date("1985-04-04"),
    Salary: 2850,
    Department_id: 20
},
{
    Employee_Id: 7506,
    Lastname: "Dennis",
    Firstname: "Lynn",
    Middlename: "S",
    Job_Id: 671,
    Manager_id: 7839,
    Hiredate: new Date("1985-05-15"),
    Salary: 2750,
    Department_id: 30
},
{
    Employee_Id: 7507,
    Lastname: "Baker",
    Firstname: "Leslie",
    Middlename: "D",
    Job_Id: 671,
    Manager_id: 7839,
    Hiredate: new Date("1985-06-10"),
    Salary: 2200,
    Department_id: 40
},
{
    Employee_Id: 7521,
    Lastname: "Wark",
    Firstname: "Cynthia",
    Middlename: "D",
    Job_Id: 670,
    Manager_id: 7698,
    Hiredate: new Date("1985-02-22"),
    Salary: 1250,
    Department_id: 10
}
]);


// 5. Display All Documents
// find() is used to retrieve documents.
db.Employee.find();


// 6. Query using Comparison Operator
// $gt is used to find values greater than condition.
db.Employee.find({ Salary: { $gt: 2000 } });


// 7. Query using Equality Condition
db.Employee.find({ Employee_Id: 7505 });


// 8. Query using AND condition
db.Employee.find({ Job_Id: 671, Department_id: 20 });


// 9. Query using OR condition
db.Employee.find({
    $or: [
        { Salary: 2200 },
        { Job_Id: 671 }
    ]
});


// 10. Query using Range Condition
// $gte and $lte define range.
db.Employee.find({
    Salary: { $gte: 1000, $lte: 2000 }
});


// 11. Sorting Documents
// sort() is used to arrange results.
db.Employee.find({ Department_id: 20 }).sort({ Salary: 1 });
db.Employee.find({ Department_id: 30 }).sort({ Salary: -1 });


// 12. Count Documents
// countDocuments() returns total records.
db.Employee.countDocuments();


// 13. Distinct Values
// distinct() returns unique values.
db.Employee.distinct("Department_id");


// 14. Update Documents
// updateMany modifies multiple records.
db.Employee.updateMany(
    { Job_Id: 671 },
    { $set: { Department_id: 10 } }
);

db.Employee.updateMany(
    { Lastname: "Smith" },
    { $set: { Lastname: "Sumit" } }
);

db.Employee.updateMany(
    { Department_id: 20 },
    { $mul: { Salary: 1.10 } }
);


// 15. Delete Documents
// deleteMany removes records.
db.Employee.deleteMany({ Department_id: 30 });


// 16. Query using AND + Comparison
db.Employee.find({
    Department_id: 10,
    Salary: { $gt: 1000 }
});


// 17. Query using IN operator
db.Employee.find({
    Department_id: { $in: [10, 20] }
});


// 18. Pattern Matching using REGEX
db.Employee.find({
    $or: [
        { Firstname: { $regex: "mit", $options: "i" } },
        { Lastname: { $regex: "mit", $options: "i" } }
    ]
});
