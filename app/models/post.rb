class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  attr_accessible :title, :body, :user_id

  def to_s
    title
  end

end
