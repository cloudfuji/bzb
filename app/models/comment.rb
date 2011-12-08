class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :comments

  def to_s
    self.body
  end

  def display_name
    user.try(:to_s) || author_name
  end

  def display_email
    user.try(:to_s) || author_email
  end
end
