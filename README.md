# BookShop

A simple web application, SQL SERVER database, using the MVC framework to achieve the basic functions of book information query, book search and view, book reservation entry.

### Table Content
* Background
   * Installation Environmental Dependence
   * Database Deploy Procedure
* Instructions for use
   * Database Information
   * Book List
   * Book Search
   * Book Reservation
   * Visitor
   * Customer
   * Admin
* Description of the catalogue structure
* Change Log

***

## Installation Environmental Dependence

1. .NET 4.8
2. Sql Server 2012

## Database Deploy Procedure
- Sql Server connect, SSMS startup with Window Authentication or SQL Server Authentication, Build tables and insert business data or attach database file 
- Connect to data source (SqlClient), test connection
- Database File: .mdf file, .LDF file and Sql query file stored in directory : Technical_Exercise/BookShop/DB
- Update Database pointer: Convert App.config and track data source location pointer to as solution, ensure that the contents of the 2 configuration files are in sync, especially the assemblyBinding tag,
*IF USE sa LOGIN, ADD IT INTO CONFIURATION FILE*

```
<add name="FamilyFinanceSystemConnectionString"  connectionString="Data Source=localhost;Initial Catalog=FamilyFinanceSystem;User ID=sa;Password=jonny814" providerName="System.Data.SqlClient"/>
```

## Database Information

| Account Type      | Username | Password     |
| :---        |    :----:   |          ---: |
| Customer      | user1       | 123456   |
| Customer      | jagol       | 123456   |
| Admin   | admin        | admin      |

## Book List
- support by Visitor, Customer, Admin apply
- support by HomePage, Cart, Bookstore display
- book Details review and book serach response 

## Book Search
- support by Visitor, Customer, Admin apply
- support by Keyword Fuzzy Search 
- support by Dropdown List Category Search
- support by HomePage, Bookstore display

## Book Reservation
- support by Customer apply
- support by Order Produce, *BUY* rather than add to cart
- shopping cart records do not trigger book reservation
- book is not allowed to be reserved if it already be ordered

## Visitor
- access to Homepage, Bookstore
- support by customer register, book search, book view

## Customer
- access to Homepage, Bookstore, Cart, My Account
- support by customer login and logout, book search, book view, book reservation, manage order

## Admin
- access to Homepage, Bookstore, Admin
- support by admin login and logout, book search, book view
- support by CRUD for user, order, book information

***

### When you open this framework project using `Visual Studio` you will see the following structure.
![WechatIMG16242](https://user-images.githubusercontent.com/78850099/215303342-3e07eb03-bec5-437d-b2e4-0bb4ea13feba.png)





`App_start Folder：` It includes configuration files

`Content Folder：` It includes jQuery and plugins

`Controller Folder：` It is equivalent to a back-end portal, including a business logic layer, a database access layer, etc.

`Models Folder：` It has all of domain class

`Views/admins Folder：` It supports CRUD for admin

`Views/books Folder：` It supports CRUD for books

`Views/Home Folder：` It provides page support for HomePage, Bookstore, Cart, and it has front-end page indication for User Login, Cart Management, Order Review

`Views/orders Folder：` It supports CRUD for orders

`Views/users Folder：` It supports CRUD for users


***


## Change Log

### v0.1 (2023/01/25 13:00 +00:00)
- Template Initialisation
- Modify constructuion to unified front page display and database information
- Modify first time online task not to roll back

### v0.2 (2023/01/27 09:00 +00:00)
- Deployment page optimisation
- Modify access for visitor and customer
- Modify cart payment and manner to produce order
- Modify book reservation, *buy* replace add to cart, define the status of book be reserved
- Modify page element， uniformity of page text messages and alerts
- Modify page Navogation, update option of book search


### v0.3 (2023/01/28 11:00 +00:00)
- Modify repo address
- Ensure error free for compatible problem between local file and remote branch
- Modify gitIgnore and README
- Version Testing

