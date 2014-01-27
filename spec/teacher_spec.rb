require 'rspec'
require 'date'

require_relative '../app/models/teacher'
require_relative '../app/models/student'


describe Teacher, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
  end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :first_name => "Missy",
      :last_name => "Elliot",
      :birthday => Date.new(1972,9,24),
      :gender => 'female',
      :email => 'missyelliot@supadupafly.net',
      :phone => '312-911-1234'
    )
  end


  it "shouldn't allow two teachers with the same email" do
    another_student = Teacher.create!(
      :birthday => @teacher.birthday,
      :email => @teacher.email,
      :phone => @teacher.phone
    )
    @teacher.should_not be_valid
  end

end


describe 'student teacher association' do
  before do
    @teacher = Teacher.create(
      :first_name => "Lady",
      :last_name => "Gaga",
      :birthday => Date.new(1972,9,24),
      :gender => 'female',
      :email => 'ladygaga@gaga.me',
      :phone => '312-911-1234'
    )
    @student = Student.create(
      :teacher_id => @teacher.id,
      :first_name => "Kreay",
      :last_name => "Shawn",
      :birthday => Date.new(1989,9,24),
      :gender => 'female',
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '510-555-1212'
    )
    @student2 = Student.create(
      :teacher_id => @teacher.id,
      :first_name => "Lupita",
      :last_name => "Suarez",
      :birthday => Date.new(1989,9,24),
      :gender => 'female',
      :email => 'lupitalovestacos@tacos.be',
      :phone => '312-999-1234'
    )
  end

  it "should return the # of students for the teacher" do
    @teacher.students.all.size == 2
  end
end


