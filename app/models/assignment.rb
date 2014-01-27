require_relative '../../db/config'

class Assignment < ActiveRecord::Base

  belongs_to :teacher
  belongs_to :student

end