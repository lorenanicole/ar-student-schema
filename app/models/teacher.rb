require_relative '../../db/config'

class Teacher < ActiveRecord::Base

  validates :email, :uniqueness => {:message => 'all teachers must
            have their own email, duh this is a one to one relationship!'}

end
