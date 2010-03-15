Given 'I am logged in' do
  # use _url to go to 'www.example.com', not 'example.org'
  visit users_url
  click_link 'Login'
end
