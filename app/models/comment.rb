class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :parent, :class_name => "Comment"
  
  has_many   :children, :class_name => 'Comment', :foreign_key => 'parent_id'

  def to_s
    self.body
  end

  def display_name
    user.try(:to_s) || author_name
  end

  def display_email
    user.try(:to_s) || author_email
  end

  def ancestors
    ancestors = []

    ancestor = parent
    while not ancestor.nil?
      ancestors << ancestor
      ancestor = ancestor.try(:parent)
    end

    puts "#{id} parent: #{parent_id}"
    puts "#{id} ancestors: #{ancestors.inspect}"
    return ancestors
  end

  # Returns an array of emails who are relevant to this comment (as
  # far as emails go)
  def users_to_notify
    emails = []

    # Walk our way up the discussion tree
    ancestors.each do |ancestor|
      emails << ancestor.display_email
    end

    # Add the post author
    emails << post.user.email

    emails.uniq
  end
end
