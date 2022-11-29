# booklib
# Instructions
**Back-end**
Localhost with XAMPP, PHP, MySQL

# Set up database
Execute SQL script: `src/assets/books.sql`

# XAMPP Run with Apache and SQL Server
The 'back-end PHP script' is an adaptation from week 9: `src/assets/apis.php`

# Configure
In folder $XAMPP/htdocs, create directory named `vuex`
Move the back-end PHP script to that directory (cp `src/assets/apis.php` > `$XAMPP/htdocs/vuex`
Change the database connection parameters in back-end PHP script (localhost, username, password, database)
In the `php.ini` file, change the `display_errors=On` > `display_errors=Off`
In the `php.ini` file, change the `display_startup_errors=On` > `display_startup_errors=Off` 

# Project SETUP
npm install

# Compiles and hot-reloads for development
npm run serve

# Compiles and minifies for production
npm run build