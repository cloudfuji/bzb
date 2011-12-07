class BushidoEmailHooks < Bushido::EventObserver
  def mail_new_comment
  end

  def mail_reply_comment
  end

  def mail_new_post
  end

  def mail_simple
    puts "YAY!"
    puts params.inspect
  end

  private
end
