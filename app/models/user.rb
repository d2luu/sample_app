class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :dateofbirth, presence: true
  validates :gender, presence: true
  validate :checkbirthday
  VALID_PHONE_NUMBER_REGEX = /0[0-9]{9,10}/
  validates :phone, presence: true, length: {minmum: 10, maximum: 11}, format:{with: VALID_PHONE_NUMBER_REGEX}
  # validates :gender

  private
  def checkbirthday
  	if !self.dateofbirth.nil?
  		if self.dateofbirth > Time.now
  			errors.add(:dateofbirth, "Cannot be in the Future")
  		elsif  self.dateofbirth < Time.now - 100.years
  			errors.add(:dateofbirth, "Cannot be over 100 years ago")
  		end
  	end
  end

  				
end
