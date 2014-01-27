require_relative '../../db/config'
require_relative 'assignment'
require_relative 'student'


class Teacher < ActiveRecord::Base

  validates :email, :uniqueness => {:message => 'all teachers must
            have their own email, duh this is a one to one relationship!'}

  has_many :assignments
  has_many :students, through: :assignments

end
