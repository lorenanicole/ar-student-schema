require_relative '../../db/config'
require_relative 'person'

class Teacher < Person

  # validates :email, :uniqueness => {:message => 'all teachers must
  #           have their own email, duh this is a one to one relationship!'}

  has_many :associations, :foreign_key => :teacher_id
  has_many :students, :through => :associations

end
