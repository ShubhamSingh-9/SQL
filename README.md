# Database Fundamentals

## What is a Database?
1) The purpose of a database is to store and describe logically related data for the organization to meet the organisation's information needs.
(A database is software that organises and stores data so that it can be retrieved whenever it is needed.

2) Database Use Cases:
   Data Storage: A database stores large amounts of structured data making it easily accessible, searchable, and retrievable.eg Ola/uber travel history.
   Data Analysis: A database can be used to perform complex data analysis, generate reports, and provide insights into the data.
   Record Keeping: A database is often used to keep track of vital records, such as financial transactions, customer information, and inventory levels.
   Web applications: Databases are essential to many web applications, providing dynamic content and user management.

## Properties of an Ideal Database:
1. Integrity: It is made of 02 words Accuracy and consistency eg. The weight in a column is the same continuously (until someone changes it from their end)
2. Availability: It is available 24/7 and has no downtime.
3. Security: Secured from any malware or attacks.
4. Independent of application: Same database for web, applications.
5. Concurrency: A Database must be able to serve data in parallel and not in sequence i.e. it answers all the questions at the same time as per the customer asked and not one after the other(sequence).


## Type of Database
1. Relational Databases: Also known as SQL databases, these databases use a relational model to organize data into tables with rows and columns.
   Datasets are stored in a database called a Table or relation. It is also called OLTP.
2. NoSQL Databases: These databases are designed to handle large amounts of unstructured or semi-structured data, such as documents, images or videos(MongoDB)
3. Column Databases: These databases store data in columns rather than rows, making them well-suited for data warehousing and analytical applications(Amazon Redshift, Google BigQuery). It is also called OLAP or warehouse and in a row database the whole data is stored and accessed which requires a lot of space as in a column when a specific data is searched only that particular data is accessed and due to this less space is occupied by the column database.
4. Graph Databases: These databases are used to store and query graph-structured data, such as social network connections or recommendation systems(Neo4j, Amazon Neptune) 
5. Key_value databases: These databases store data as a collection of keys and values, making them well-suited for caching and simple data storage needs(Redis and Amazon DynamoDB). X(Twitter) and Instagram no. of followers the system doesn't calculate each time you log in the no, comes up automatically so the nos are stored.

![downloadh](https://github.com/ShubhamSingh-9/SQL/assets/111279439/10104bc7-98c6-46ae-b4ed-3715943d56fe)


# SQL
XAMPP and MYSQL for accessing the database.

## Where function
We use 'Where' as a filter on the rows 

## To know no. of rows in the given table
use count(*) 

## Having
Just like WHERE which acts as a filter for rows after the SELECT Function is called HAVING acts as a filter for the GROUP BY Function.

## Date Columns
The date is normally in text format to convert the date to the Date format or Time Date series we can use DATE()
Eg if we have the date columns in text format we can convert it into Time-Series Format by DATE(date) by adding MONTH or MONTHNAME before the () we can extract the month details.

## Subqueries
Subqueries is a query within another query. It is a SELECT statement that is nested inside another SELECT, INSERT, UPDATE, or DELETE statement. The subquery is executed first, and its result is then used as a parameter or condition for the outer query.

### Type of Subqueries
1. The result it return.
2. Based on working.

