module ChatsHelper
  def recipient_options_for_select(selected_recipient=nil)
    options_from_collection_for_select(
      User.all - [current_user], :to_param, :name,
      selected_recipient
    )
  end

  def chat_users(chat)
    chat.users.map {|user| link_to_user(user)}.join(', ').html_safe
  end

  def parted_chat_users(chat)
    chat.parted_users.map {|user| link_to_user(user)}.join(', ').html_safe
  end

  def chat_digest(chat)
    if chat.messages.present?
      truncate(chat.messages.last.body.squish, :length => 20)
    else
      '&mdash;'.html_safe
    end
  end

  def link_to_user(user)
    user == current_user ? 'You' : link_to(user.name, user_path(user))
  end

  def unread_counter_for(chat)
    unread = chat.unread_count
    read = chat.messages_count
    if unread == 0
      if read == 1
        ""
      else
        "(#{read})"
      end
    elsif unread == read
      "(<strong>#{unread}</strong>)"
    else
      "(<strong>#{unread}</strong>/#{read})"
    end.html_safe
  end

  def url_for_message(message)
    chat_path(message.chat, :anchor => dom_id(message))
  end
end
