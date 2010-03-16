module UserHelpers

  def set_current_username(username)
    @current_username = username
  end

  def current_username
    @current_username
  end

  def user_by_name(username)
    User.find_by_name!( %W(I You).include?(username) ? current_username : username )
  end

end

World(UserHelpers)
