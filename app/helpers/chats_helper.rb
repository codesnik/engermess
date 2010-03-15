module ChatsHelper
  def recipient_options_for_select
    options_from_collection_for_select(User.all - [current_user], :id, :name)
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
end
