ActiveRecord Student Schema
===========================

To get started:

1. Fork this repository.
2. Clone your fork of this repository into your working directory.
3. Install the necessary dependencies using Bundler: `$ bundle`
4. Create your database: `$ rake db:create`
5. Implement the objectives as described in the challenge in Socrates.


To populate the final assignments table with student and teacher assignments follow these steps --

1. Remove the migration '201301261842_update_assignments.rb' from migrations
2. Run rake db:create
3. Run rake db:migrate
4. Run rake db:populate
5. Move '201301261842_update_assignments.rb' back into the migrations folder and execute run rake db:create

The migrations are out of sync with the rake task populate since the last migration is more or less a "task" that modifies the data (and not the schema as traditional migrations do).

Ergo, you have to tweak the process to accomplish the assignments of teachers to students!

