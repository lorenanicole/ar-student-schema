require_relative '../config'
require_relative '../../app/models/teacher'
require_relative '../../app/models/student'

class UpdateAssignments < ActiveRecord::Migration

  def change

    t_id = Teacher.all

    puts t_id

    Student.all.each do |s|
      puts "----"
      puts s.id
      puts "---"
      puts t_id.sample
      Assignment.create(:student_id => s.id, :teacher_id => t_id.sample.id)
    end

  end

end