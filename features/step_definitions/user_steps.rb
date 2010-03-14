Given 'user $user registered' do |user|
  User.find_or_create_by_name(user)
end
