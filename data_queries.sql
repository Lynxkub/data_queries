1. SELECT * FROM owners LEFT JOIN vehicles ON owners.id=vehicles.owner_id;
 id | first_name | last_name | id |  make  |  model  | year |  price   | owner_id
----+------------+-----------+----+--------+---------+------+----------+----------
  1 | Bob        | Hope      |  1 | Toyota | Corolla | 2002 |  2999.99 |        1
  1 | Bob        | Hope      |  2 | Honda  | Civic   | 2012 | 12999.99 |        1
  2 | Jane       | Smith     |  3 | Nissan | Altima  | 2016 | 23999.99 |        2
  2 | Jane       | Smith     |  4 | Subaru | Legacy  | 2006 |  5999.99 |        2
  3 | Melody     | Jones     |  5 | Ford   | F150    | 2012 |  2599.99 |        3
  3 | Melody     | Jones     |  6 | GMC    | Yukon   | 2016 | 12999.99 |        3
  4 | Sarah      | Palmer    |  7 | GMC    | Yukon   | 2014 | 22999.99 |        4
  4 | Sarah      | Palmer    |  8 | Toyota | Avalon  | 2009 | 12999.99 |        4
  4 | Sarah      | Palmer    |  9 | Toyota | Camry   | 2013 | 12999.99 |        4
  5 | Alex       | Miller    | 10 | Honda  | Civic   | 2001 |  7999.99 |        5
  6 | Shana      | Smith     | 11 | Nissan | Altima  | 1999 |  1899.99 |        6
  6 | Shana      | Smith     | 12 | Lexus  | ES350   | 1998 |  1599.99 |        6
  6 | Shana      | Smith     | 13 | BMW    | 300     | 2012 | 22999.99 |        6
  6 | Shana      | Smith     | 14 | BMW    | 700     | 2015 | 52999.99 |        6
  7 | Maya       | Malarkin  |    |        |         |      |          |
(15 rows)


2.SELECT first_name, last_name, COUNT(owner_id) FROM owners JOIN vehicles ON owners.id = vehicles.owner_i
d GROUP BY (first_name, last_name) ORDER BY first_name;
 first_name | last_name | count
------------+-----------+-------
 Alex       | Miller    |     1
 Bob        | Hope      |     2
 Jane       | Smith     |     2
 Melody     | Jones     |     2
 Sarah      | Palmer    |     3
 Shana      | Smith     |     4
(6 rows)

3.SELECT first_name, last_name, AVG(price) AS average_price, COUNT(owner_id) AS count FROM owners JOIN vehicles ON owners.id = vehicles.owner_id GROUP BY (first_name, last_name) HAVING COUNT(owner_id) > 1 AND AVG(price) > 100
00 ORDER BY count DESC;
 first_name | last_name |   average_price    | count
------------+-----------+--------------------+-------
 Shana      | Smith     | 19874.989624023438 |     4
 Sarah      | Palmer    | 16333.323567708334 |     3
 Jane       | Smith     |    14999.990234375 |     2
(3 rows)