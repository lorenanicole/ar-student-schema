require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone
      t.datetime :created_at
      t.datetime :updated_at
    end

  end
end


=begin

Documentation on column data types for Active Record

http://stackoverflow.com/questions/3956186/where-is-the-documentation-page-for-activerecord-data-types
http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html
  
=end


