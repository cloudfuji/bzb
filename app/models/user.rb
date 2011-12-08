class User < ActiveRecord::Base

  devise :trackable, :validatable, :bushido_authenticatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :active, :ido_id

  attr_accessor :password

  validates_presence_of :email
  validates_presence_of :ido_id

  before_validation Proc.new { |user| user.password ||= "asdfjalsdjfkalsdf" }
  before_validation Proc.new { |user| user.active   ||= true }

  has_many :posts

  def active?
    !!active
  end

  def disable!
    self.active = false
    save
  end

  def inactive_method
    "Sorry, your account isn't active for this app"
  end

  def to_s
    return "#{self.first_name} #{self.last_name}" if self.first_name && self.last_name
    self.email
  end
end
