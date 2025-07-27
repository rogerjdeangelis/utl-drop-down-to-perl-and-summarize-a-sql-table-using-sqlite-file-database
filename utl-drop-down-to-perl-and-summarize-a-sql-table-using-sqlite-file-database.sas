%let pgm=utl-drop-down-to-perl-and-summarize-a-sql-table-using-sqlite-file-database;

%stop_submission;

Drop down to perl and summarize a sql table using sqlite file database

PROCESS

   1 SAS create sas table have
   2 R load sas table into sqlite database
   3 PERL summarizes sqliter table using a sqlite query
   4 PERL Results back to base PERL
   5 R converts PERL summarized table back to SAS
   6 Drop down macro on end, in the repo and in many macros repo

github
https://tinyurl.com/yxvwzhz7
https://github.com/rogerjdeangelis/utl-drop-down-to-perl-and-summarize-a-sql-table-using-sqlite-file-database

You need to install strawberry perl
How to unstall package DBI in strawberry perl
C:\Windows\system32>cpanm DBI


/**************************************************************************************************************************/
/* INPUT                            |  PROCESS                                         |  OUTPUTS                         */
/* =====                            |  =======                                         |  ======                          */
/* SQLITE TABLE HAVE                |  %utl_plbegin;                                   |  PERL SQLITE TABLE AVGAGE        */
/* >print(dbListTables(con))        |  parmcards4;                                     |                                  */
/*                                  |  #!/usr/bin/perl                                 |  SEX AVGAGE                      */
/* [1] "have"                       |  use strict;                                     |   F     13                       */
/*                                  |  use warnings;                                   |   M     14                       */
/* +  ,"select * from have")        |  use DBI;                                        |                                  */
/*                                  |  my $driver  ="SQLite";                          |  PERL ARRAY                      */
/*      NAME SEX AGE                |  my $database="c:/temp/tst.db";                  |                                  */
/* 1  Alfred   M  14                |  my $dsn     ="DBI:$driver:dbname=$database";    |  $ROW[0]  $ROW[1]                */
/* 2   Alice   F  13                |  my $dbh = DBI->connect($dsn, "", "");           |                                  */
/* 3 Barbara   F  13                |                                                  |  sex= F   avgage=13              */
/* 4   Carol   F  13                |  my $table = "avgage";                           |  sex= M   avgage=14              */
/* 5   Henry   M  14                |  my $sql = "drop table if exists $table";        |                                  */
/* 6   James   M  14                |                                                  |  DATABASE TABLES                 */
/*                                  |  $dbh->do($sql) or die $dbh->errstr;             |                                  */
/* LOAD SAS TABLE INTO SQLITE       |                                                  |  main.have (SQL TABLE FROM R     */
/*                                  |  my $stmt = qq(                                  |  main.avgage (PERL SQL TABLE)    */
/* options                          |    create                                        |                                  */
/*  validvarname=upcase;            |       table avgage as                            |  BACK TO R AND SAS               */
/* libname sd1 "d:/sd1";            |    select                                        |                                  */
/* data sd1.have;                   |       sex                                        |  R                               */
/*   input                          |      ,avg(age) as avgage                         |                                  */
/*     name$                        |    from                                          |  > print(want)                   */
/*     sex$ age;                    |       have                                       |    SEX avgage                    */
/* cards4;                          |    group                                         |  1   F     13                    */
/* Alfred  M 14                     |       by sex;                                    |  2   M     14                    */
/* Alice   F 13                     |  );                                              |                                  */
/* Barbara F 13                     |  my $sth = $dbh->prepare($stmt);                 |                                  */
/* Carol   F 13                     |  my $rv = $sth->execute() or die $DBI::errstr;   |  SAS                             */
/* Henry   M 14                     |                                                  |                                  */
/* James   M 14                     |  my $sth2 = $dbh->prepare("                      |  SEX    AVGAGE                   */
/* ;;;;                             |    select                                        |                                  */
/* run;quit;                        |       sex                                        |   F       13                     */
/*                                  |      ,avgage                                     |   M       14                     */
/* %utlfkil(c:/temp/tst.db);        |   from                                           |                                  */
/*                                  |      avgage");                                   |                                  */
/* %utl_rbeginx;                    |   $sth2->execute();                              |                                  */
/* parmcards4;                      |   while (my @row = $sth2->fetchrow_array()) {    |                                  */
/* library(haven)                   |       print "sex    = $row[0]\n";                |                                  */
/* library(DBI)                     |       print "avgage = $row[1]\n";                |                                  */
/* library(RSQLite)                 |   }                                              |                                  */
/* have<-read_sas(                  |  my @tables = $dbh->tables();                    |                                  */
/*   "d:/sd1/have.sas7bdat")        |  for my $table (@tables) {                       |                                  */
/* con <- dbConnect(SQLite()        |      print "$table\n";                           |                                  */
/*   ,dbname = "c:/temp/tst.db")    |  }                                               |                                  */
/* dbWriteTable(                    |  $sth->finish;                                   |                                  */
/*    con                           |  $dbh->disconnect();                             |                                  */
/*   ,"have"                        |  ;;;;                                            |                                  */
/*   ,have                          |  %utl_plend;                                     |                                  */
/*   ,overwrite = TRUE)             |                                                  |                                  */
/* print(dbListTables(con))         |                                                  |                                  */
/* want <- dbGetQuery(              |  %utl_rbeginx;                                   |                                  */
/*   con                            |  parmcards4;                                     |                                  */
/*  ,"select * from have")          |  library(DBI)                                    |                                  */
/* print(want)                      |  library(RSQLite)                                |                                  */
/* dbDisconnect(con)                |  source("c:/oto/fn_tosas9x.R")                   |                                  */
/* ;;;;                             |  con <- dbConnect(SQLite()                       |                                  */
/* %utl_rendx;                      |    ,dbname = "c:/temp/tst.db")                   |                                  */
/*                                  |  tb<-dbListTables(con)                           |                                  */
/*                                  |  tb                                              |                                  */
/*                                  |  want <- dbGetQuery(con                          |                                  */
/*                                  |    ,"select * from avgage")                      |                                  */
/*                                  |  print(want)                                     |                                  */
/*                                  |  fn_tosas9x(                                     |                                  */
/*                                  |        inp    = want                             |                                  */
/*                                  |       ,outlib ="d:/sd1/"                         |                                  */
/*                                  |       ,outdsn ="want"                            |                                  */
/*                                  |       )                                          |                                  */
/*                                  |  ;;;;                                            |                                  */
/*                                  |  %utl_rendx;                                     |                                  */
/*                                  |                                                  |                                  */
/*                                  |  proc print data=sd1.want;                       |                                  */
/*                                  |  run;                                            |                                  */
/**************************************************************************************************************************/
/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
  input
    name$
    sex$ age;
cards4;
Alfred  M 14
Alice   F 13
Barbara F 13
Carol   F 13
Henry   M 14
James   M 14
;;;;
run;quit;

%utlfkil(c:/temp/tst.db);

%utl_rbeginx;
parmcards4;
library(haven)
library(DBI)
library(RSQLite)
have<-read_sas("d:/sd1/have.sas7bdat")
con <- dbConnect(SQLite(), dbname = "c:/temp/tst.db")
dbWriteTable(con, "have", have, overwrite = TRUE)
print(dbListTables(con))
dbDisconnect(con)
;;;;
%utl_rendx;

/**************************************************************************************************************************/
/* SQLITE TABLE HAVE                                                                                                      */
/* >print(dbListTables(con))                                                                                              */
/*                                                                                                                        */
/* [1] "have"                                                                                                             */
/*                                                                                                                        */
/* +  ,"select * from have")                                                                                              */
/*                                                                                                                        */
/*      NAME SEX AGE                                                                                                      */
/* 1  Alfred   M  14                                                                                                      */
/* 2   Alice   F  13                                                                                                      */
/* 3 Barbara   F  13                                                                                                      */
/* 4   Carol   F  13                                                                                                      */
/* 5   Henry   M  14                                                                                                      */
/* 6   James   M  14                                                                                                      */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|              _
 _ __   ___ _ __| |
| `_ \ / _ \ `__| |
| |_) |  __/ |  | |
| .__/ \___|_|  |_|
|_|
*/
%utl_plbegin;
parmcards4;
#!/usr/bin/perl
use strict;
use warnings;
use DBI;
my $driver  ="SQLite";
my $database="c:/temp/tst.db";
my $dsn     ="DBI:$driver:dbname=$database";
my $dbh = DBI->connect($dsn, "", "");

my $table = "avgage";
my $sql = "drop table if exists $table";

$dbh->do($sql) or die $dbh->errstr;

my $stmt = qq(
  create
     table avgage as
  select
     sex
    ,avg(age) as avgage
  from
     have
  group
     by sex;
);
my $sth = $dbh->prepare($stmt);
my $rv = $sth->execute() or die $DBI::errstr;

my $sth2 = $dbh->prepare("
  select
     sex
    ,avgage
 from
    avgage");
 $sth2->execute();
 while (my @row = $sth2->fetchrow_array()) {
     print "sex    = $row[0]\n";
     print "avgage = $row[1]\n";
 }
my @tables = $dbh->tables();
for my $table (@tables) {
    print "$table\n";
}
$sth->finish;
$dbh->disconnect();
;;;;
%utl_plend;

/*
 _ __
| `__|
| |
|_|

*/
%utl_rbeginx;
parmcards4;
library(DBI)
library(RSQLite)
source("c:/oto/fn_tosas9x.R")
con <- dbConnect(SQLite()
  ,dbname = "c:/temp/tst.db")
tb<-dbListTables(con)
tb
want <- dbGetQuery(con
  ,"select * from avgage")
print(want)
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;

/**************************************************************************************************************************/
/* PERL SQLITE TABLE AVGAGE |  PERL ARRAY         | DATABASE TABLES              |  R              |   SAS                */
/*                          |                     |                              |                 |                      */
/* SEX AVGAGE               |  $ROW[0]  $ROW[1]   | main.have (SQL TABLE FROM R  |  > print(want)  |   SEX    AVGAGE      */
/*  F     13                |                     | main.avgage (PERL SQL TABLE) |    SEX avgage   |                      */
/*  M     14                |  sex= F   avgage=13 |                              |  1   F     13   |    F       13        */
/*                          |  sex= M   avgage=14 |                              |  2   M     14   |    M       14        */
/**************************************************************************************************************************/*/
/*
 _ __ ___   __ _  ___ _ __ ___  ___
| `_ ` _ \ / _` |/ __| `__/ _ \/ __|
| | | | | | (_| | (__| | | (_) \__ \
|_| |_| |_|\__,_|\___|_|  \___/|___/

*/

/*---- save macros in autoall folder ----*/
filename ft15f001 "c:/oto/utl_plbegin.sas";
parmcards4;
%macro utl_plbegin / des="drop down to perl";;
%utlfkil(c:/temp/pl_pgm.txt);
%utlfkil(c:/temp/pl_log.txt);
filename ft15f001 "c:/temp/pl_pgm.txt";
%mend utl_plbegin;
;;;;
run;quit;

filename ft15f001 "c:/oto/utl_plend.sas";
parmcards4;
%macro utl_plend(returnvar=N);
options noxwait noxsync;
filename rut pipe "d:\strawberry\perl\bin\perl c:/temp/pl_pgm.txt > c:/temp/pl_log.txt";
run;quit;
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    put _infile_;
    putlog _infile_;
  run;
  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/pl_log.txt";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_plend;
;;;;
run;quit;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
