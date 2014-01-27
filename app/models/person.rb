require_relative '../../db/config'

class Person < ActiveRecord::Base

  validates :email, :format => { :with => /.+@\w+\.\w{2,4}/ },
            :uniqueness => true
  validates :phone, :format => { :with => /\d{3}-\d{3}-\d{4}/ }

end