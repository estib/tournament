
Project Name:

"Udacity_Project_2"


Use:

This project contains a .sql file intended to build a psql database for a
tournament that pairs up players according to the swiss pairing system (in
which all players play those players who have the most similar record to their
own). The "tournament.py" file contains all the functions necessary to
communicate with the database in an actual practical scenario. The
"tournament_test.py" file tests the function and database files to make sure
that certain things work.


How to run:

The user ought to have access to a vagrant account and should be connected to
the appropriate ssh where they can access the files for the project. The
following three files should be found in the directory:

1. tournament.sql (will create database)
2. tournament.py (contains functions for communicating with the database)
3. tournament_test.py (tests out the functions and the database to make sure
they complete certain activities correcty).

Once connected with the correct directory, run psql and, in psql, the
"tournament.sql" file. Once the database and its contents are created, run
"tournament_test.py" from python.


Author:

"tournament.sql" was written by Stephen Lechner, except for some comments in
the beginning, which were written by Udacity.

The function names and first comments in "tournament.py" were written by
Udacity. All other contents of the fil were written by Stephen Lechner.

"tourament_test.py" was written by Udacity.
