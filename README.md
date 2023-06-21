# freeCodeCamp Periodic Table Database challenge

## Instructions

You are started with a periodic_table database that has information about some chemical elements. You can connect to it by entering `psql --username=freecodecamp --dbname=periodic_table` in the terminal. You may want to get a little familiar with the existing tables, columns, and rows. Read the instructions below and complete user stories to finish the project. Certain tests may not pass until other user stories are complete. Good luck!

### Part 1: Fix the database

There are some mistakes in the database that need to be fixed or changed. See the user stories below for what to change.

### Part 2: Create your git repository

You need to make a small bash program. The code needs to be version controlled with git, so you will need to turn the suggested folder into a git repository.

### Part 3: Create the script

Lastly, you need to make a script that accepts an argument in the form of an atomic number, symbol, or name of an element and outputs some information about the given element. In your script, you can create a PSQL variable for querying the database like this: `PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"`, add more flags if you need to.

>If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering `pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql` in a bash terminal (not the psql one). It will save the commands to rebuild your database in `periodic_table.sql`. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering `psql -U postgres < periodic_table.sql` in a terminal where the .sql file is.

>If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the `periodic_table.sql` file, as well as the final version of your `element.sh` file, in a public repository and submit the URL to it on freeCodeCamp.org.
