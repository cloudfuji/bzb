puts "Loading post_observer"
class PostObserver < ActiveRecord::Observer
  observe :post

  def after_create(post)
    puts "Should email post author that their post has been posted"
  end
end
