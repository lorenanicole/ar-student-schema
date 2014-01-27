require_relative '../../db/config'
require_relative 'person'
require_relative 'assignment'

class Student < Person

  has_many :associations, :foreign_key => :student_id
  has_many :teachers, :through => :associations

  # belongs_to :person

  # validates :email, :format => { :with => /.+@\w+\.\w{2,4}/ },
  #           :uniqueness => true
  #           # (510) 555-1212 x4567
  # validates :phone, :format => { :with => /\d{3}-\d{3}-\d{4}/ }
  # validates :age, :numericality => { :greater_than => 5 }
  # validate :not_a_youngin

  # after_create :set_teacher_id

  def name
    "#{self[:first_name]} #{self[:last_name]}"
  end

  def age
    birthday_to_age(self[:birthday])
  end

  # def not_a_youngin
  #   unless age > 5
  #     errors.add(:age, "must not be less that 6")
  #   end

  #   ## record.errors.full_message record is the active record object
  # end

  def set_teacher_id
    Assignment.create(:teacher_id => ((self.id % 9) + 1), :student_id => self.id)
    # self.teacher_id = (self.id % 9) + 1
  end

  private

  def birthday_to_age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

end

