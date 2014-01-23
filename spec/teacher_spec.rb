require 'rspec'
require 'date'
require_relative '../app/models/teacher'


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

