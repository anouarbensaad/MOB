# Management Of Computer Breakdowns
A project management of computer breakdowns in university with Ruby&amp;Rails (FrenchVersion)

#Requirements

* Ruby 2.5.1
* Rails 5.2.0
* Mysql-server

#Installation

* Clone the repository. `git clone https://github.com/anouarbensaad/management-of-computer-breakdowns.git` and switch into the directory `cd Hmanagement-of-computer-breakdowns`

#Configuration DATABASES

* Create user pannes with privileges :

`mysql -u root -p` ,
`GRANT ALL PRIVILEGES ON *.* TO 'pannes'@'localhost' IDENTIFIED BY 'bensaad';`

* Create 3 DATABASES

* pannes

`CREATE DATABASE pannes;` ,
`GRANT ALL PRIVILEGES ON pannes.* TO 'pannes'@'localhost' IDENTIFIED BY 'bensaad';`

* pannes_development

`CREATE DATABASE pannes_development;` ,
`GRANT ALL PRIVILEGES ON pannes_development.* TO 'pannes'@'localhost' IDENTIFIED BY 'bensaad';`

* pannes_test

`CREATE DATABASE pannes_test;` ,
`GRANT ALL PRIVILEGES ON pannes_test.* TO 'pannes'@'localhost' IDENTIFIED BY 'bensaad';` ,
`FLUSH PRIVILEGES;`

#upgraded & Running

ou'll need to type this following command to resolve this:

* `rake db:setup`
* `rake db:migrate`
* `rake db:seed`

Install all Package GemFile 

* `bundle install`

Running Server

* `rails s`
