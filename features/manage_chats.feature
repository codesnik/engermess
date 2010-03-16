Feature: Manage chats
  In order to test my mad rails skills
  I, Codesnik
  want to create something like moikrug.ru messaging

  Background:
    Given user Alexey registered
    And I am logged in as Alexey

  Scenario: Create new chat
    Given I am on the new chat page
    When I fill in "Subject" with "subject 1"
    And I fill in "Body" with "blablabla"
    And I press "Create"
    Then I should see "subject 1"


  Scenario: Initiate chat with a peer
    Given user Vasya registered
    And I am on the new chat page
    When I fill in "Subject" with "subject 2"
    And I fill in "Body" with "blablabla"
    And I select "Vasya" from "Recipient"
    And I press "Create"
    And I am logged in as Vasya
    And I am on the chat index page
    Then I should see "subject 2"

  Scenario: Initiate chat from peer's profile
    # Dry it up too
    Given user Vasya registered
    And I am on the user index page
    And I follow "Vasya"
    And I follow "Send message"
    When I fill in "Subject" with "subject 3"
    And I fill in "Body" with "blablabla"
    And I press "Create"
    And I am logged in as Vasya
    And I am on the chat index page
    Then I should see "subject 3"

  Scenario: Reply to a chat
    # TODO dry it
    Given user Vasya registered
    And I am on the new chat page
    When I fill in "Subject" with "subject 2"
    And I fill in "Body" with "blablabla"
    And I select "Vasya" from "Recipient"
    And I press "Create"
    And I am logged in as Vasya
    And I am on the chat index page
    Then I should see "subject 2"

    When I follow "subject 2"
    And I fill in "Body" with "blablabla, indeed"
    And I press "Create"
    And I should see "Message was successfully created." within "#flash"
    Then I should see "blablabla, indeed"

  Scenario: Display chats
    Given I participate in the following chats:
      |subject|
      |subject 1|
      |subject 2|
    And user Vasya registered
    And Vasya participates in the following chats:
      |subject|
      |subject 3|
      |subject 4|
    And I am on the chat index page
    Then I should see the following chats:
      |Subject|
      |subject 2|
      |subject 1|

  Scenario: Leave chat
    Given I participate in the following chats:
      |subject|
      |subject 1|
      |subject 2|
      |subject 3|
      |subject 4|
    And I am on the chat index page
    When I follow "subject 3"
    And I follow "Leave chat"
    Then I should see the following chats:
      |Subject|
      |subject 4|
      |subject 2|
      |subject 1|
