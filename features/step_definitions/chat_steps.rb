Given /^the following chats:$/ do |chats|
  Chat.create!(chats.hashes)
end

Given /^(.*) participates? in the following chats:$/ do |user_name, chats|
  user = user_by_name(user_name)
  chats.hashes.each do |attrs|
    user.chats.create!(attrs)
  end
end

Given 'chats:' do |chats|
  chats.hashes.each do |attrs|
    users = attrs.delete("users").split(/, ?/).map{|n| user_by_name(n)}
    chat = Chat.create!(attrs)
    chat.users = users
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) chat$/ do |pos|
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following chats:$/ do |expected_chats_table|
  expected_chats_table.diff!(tableish('table tr', 'td,th'))
end
