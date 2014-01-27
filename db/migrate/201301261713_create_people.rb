require_relative '../config'

class CreatePeople < ActiveRecord::Migration

  def change
    create_table :people do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone
      t.datetime :created_at
      t.datetime :updated_at
    end

    remove_column(:students, :first_name)
    remove_column(:students, :last_name)
    remove_column(:students, :gender)
    remove_column(:students, :birthday)
    remove_column(:students, :email)
    remove_column(:students, :phone)

    remove_column(:teachers, :first_name)
    remove_column(:teachers, :last_name)
    remove_column(:teachers, :gender)
    remove_column(:teachers, :birthday)
    remove_column(:teachers, :email)
    remove_column(:teachers, :phone)

    add_column(:students, :people_id, :integer)
    add_column(:teachers, :people_id, :integer)

    # People.all.each do |p|
    #   if p.type == "Student"
    #     Student.create(:people_id => p.id)


  end

end