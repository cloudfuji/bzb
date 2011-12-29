class User < ActiveRecord::Base
  def bushido_extra_attributes(extra_attributes)
    self.first_name = extra_attributes["first_name"].to_s
    self.last_name  = extra_attributes["last_name"].to_s
    self.email      = extra_attributes["email"]
    self.locale     = extra_attributes["locale"]
    self.timezone     = extra_attributes["timezone"]
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :bushido_authenticatable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :ido_id, :first_name, :last_name

  validates_presence_of :email
  validates_presence_of :ido_id

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
