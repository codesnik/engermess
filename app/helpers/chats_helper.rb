module ChatsHelper
  def recipient_options_for_select
    options_from_collection_for_select(User.all - [current_user], :id, :name)
  end
end
