class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  attr_accessible :title, :body, :user_id

  def to_s
    title
  end

  # TODO: Add in a converter that changes inline-code to super-sexy code
  def render_body
    body
  end
end
