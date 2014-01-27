require_relative '../config'

class CreateAssignments < ActiveRecord::Migration

  def change
    remove_column(:students, :teacher_id)

    create_table :assignments do |t|
      t.belongs_to :teacher
      t.belongs_to :student
    end

  end

end