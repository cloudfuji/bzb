class BushidoEmailHooks < Bushido::EventObserver
  def mail_destroy_post
    post = Post.find_by_title_and_user_id(params['post_title'], user.id)
    post.try(:destroy)
  end

  def mail_reply_comment
    post    = Post.find_by_title(params['post_title'])
    parent  = post.comments.find(params['parent_id'])
    comment = post.comments.create(:parent_id => parent.id,
                                   :user_id   => user.id,
                                   :body      => params['mail']['body-plain'])
  end

  def mail_new_post
    puts "Tags: #{tags.inspect}"
    post = Post.create(:title   => params['post_title'],
                       :body    => params['mail']['body-plain'],
                       :user_id => user.id)
  end

  def mail_simple
    puts "Hit the simple mail route!"
    puts params.inspect
  end

  
  private

  def user
    @user   = User.find_by_email(params['from_email'])
    @user ||= User.find_by_email(params['mail']['sender'])
  end

  def tags
    tags = params['tags']
    tags.split(',').collect{ |tag| tag.strip } if tags
  end
end
