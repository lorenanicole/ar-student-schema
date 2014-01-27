require_relative '../../db/config'
require_relative 'person'
require_relative 'assignment'
require_relative 'student'


class Teacher < Person

  # validates :email, :uniqueness => {:message => 'all teachers must
  #           have their own email, duh this is a one to one relationship!'}

  has_many :assignments, :foreign_key => :teacher_id
  has_many :students, through: :assignments

end
