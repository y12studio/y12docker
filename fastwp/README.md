install fastwp
-------

```
$ docker run y12docker/fastwp:4.2.2 | bash -
$ cd fastwp && source alias.sh
$ dcup
$ wpinstall 192.168.2.73 wp/plugin2.txt
$ wpinfo
WordPress version: 4.2.2
Database revision: 31535
TinyMCE version:   4.109 (4109-20150505)
tput: No value for $TERM and no -T specified
+----+------------+--------------+--------------+--------------+--------------+
| ID | user_login | display_name | user_email   | user_registe | roles        |
|    |            |              |              | red          |              |
+----+------------+--------------+--------------+--------------+--------------+
| 1  | V5kZV6Fz   | V5kZV6Fz     | user@example | 2015-05-10 1 | administrato |
|    |            |              | .org         | 4:30:04      | r            |
+----+------------+--------------+--------------+--------------+--------------+
tput: No value for $TERM and no -T specified
+--------------------------+----------+--------+---------+
| name                     | status   | update | version |
+--------------------------+----------+--------+---------+
| akismet                  | inactive | none   | 3.1.1   |
| google-analyticator      | active   | none   | 6.4.8   |
| google-sitemap-generator | active   | none   | 4.0.8   |
| hello                    | inactive | none   | 1.6     |
+--------------------------+----------+--------+---------+
tput: No value for $TERM and no -T specified
+----------------+----------+--------+---------+
| name           | status   | update | version |
+----------------+----------+--------+---------+
| minamaze       | inactive | none   | 1.1.7   |
| twentyfifteen  | active   | none   | 1.2     |
| twentyfourteen | inactive | none   | 1.4     |
| twentythirteen | inactive | none   | 1.5     |
+----------------+----------+--------+---------+
```

build y12docker/fastwp
-----

```
$ docker build -t y12docker/fastwp:4.2.2 .
$ docker push y12docker/fastwp:4.2.2
```
