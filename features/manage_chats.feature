Feature: Manage chats
  In order to test my mad rails skills
  I, Codesnik
  want to create something like moikrug.ru messaging

  Scenario: Create new chat
    Given I am on the new chat page
    When I fill in "Subject" with "subject 1"
    And I press "Create"
    Then I should see "subject 1"

  Scenario: I see only my chats
    Given I participate in the following chats:
      |subject|
      |subject 1|
      |subject 2|
    And Vasya participates in the following chats:
      |subject|
      |subject 3|
      |subject 4|
    And I am on the chat index page
    Then I should see the following chats:
      |Subject|
      |subject 1|
      |subject 2|

  Scenario: Delete chat
    Given I participate in the following chats:
      |subject|
      |subject 1|
      |subject 2|
      |subject 3|
      |subject 4|
    When I delete the 3rd chat
    Then I should see the following chats:
      |Subject|
      |subject 1|
      |subject 2|
      |subject 4|
