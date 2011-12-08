# Mail routes
::Bushido::Mailroute.map do |m|
  m.route("mail.simple") do
    m.subject("hello")

    m.add_constraint(:'body-plain', :not_allowed)
  end

  m.route("mail.destroy_post") do
    m.subject('(destroy|delete) {:post_title}', :post_title => m.words_and_spaces)

    # Must be replying to send a new comment via email
    m.add_constraint(:reply, :not_allowed)
  end

  m.route("mail.reply_comment") do
    m.subject('{:post_title}: comment {:parent_comment_id}',
              :post_title        => m.words_and_spaces,
              :mock_title        => m.words_and_spaces,
              :mock_version      => m.number,
              :parent_comment_id => m.number)

    
    # Must be replying to send a new comment via email
    m.add_constraint(:reply, :required)
  end

  m.route("mail.new_post") do
    m.subject('{:post_title}', :post_title => m.words_and_spaces)

    # Must be replying to send a new comment via email
    m.add_constraint(:reply, :not_allowed)
  end
end
