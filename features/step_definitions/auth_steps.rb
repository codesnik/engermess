Given 'I am logged in as $username' do |username|
  # use _url to go to 'www.example.com', not 'example.org'
  visit users_url
  within(:xpath, "//tr[td/text()='#{username}']") do
    click 'Login'
  end
end
