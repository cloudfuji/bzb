puts "Loading comment_observer"
class CommentObserver < ActiveRecord::Observer
  observe :comment

  def after_create(comment)
    puts "Should email all the following people about this comment creation:"
    puts comment.users_to_notify.inspect
  end
end
