require_relative '../../db/config'
require_relative 'teacher'
require_relative 'student'

class Assignment < ActiveRecord::Base

  belongs_to :teacher
  belongs_to :student

end