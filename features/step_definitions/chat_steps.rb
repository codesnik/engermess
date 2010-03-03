Given /^the following chats:$/ do |chats|
  Chat.create!(chats.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) chat$/ do |pos|
  visit chats_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following chats:$/ do |expected_chats_table|
  expected_chats_table.diff!(tableish('table tr', 'td,th'))
end
