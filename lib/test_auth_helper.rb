module TestAuthHelper
  def login_as(user)
    @controller.send :login, user
  end
  def logout
    @controller.send :logout
  end
end
