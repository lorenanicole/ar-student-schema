require_relative '../config'
require_relative '../../app/models/student'

class UpdateStudents < ActiveRecord::Migration

  def change
    add_column(:students, :name, :string)

    Student.all.each do |s|
      s.update_attributes(:name => s.first_name + " " + s.last_name)
    end

    remove_column(:students, :first_name)
    remove_column(:students, :last_name)
  end

end