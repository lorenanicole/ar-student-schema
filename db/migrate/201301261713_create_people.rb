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

    drop_table(:students)
    drop_table(:teachers)

  end

end