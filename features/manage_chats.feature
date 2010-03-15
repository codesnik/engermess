Feature: Manage chats
  In order to test my mad rails skills
  I, Codesnik
  want to create something like moikrug.ru messaging

  Background:
    Given user Alexey registered
    Given I am logged in as Alexey

  Scenario: Create new chat
    Given I am on the new chat page
    When I fill in "Subject" with "subject 1"
    When I fill in "Body" with "blablabla"
    And I press "Create"
    Then I should see "subject 1"

  Scenario: Initiate chat with a peer
    Given user Vasya registered
    Given I am on the new chat page
    When I fill in "Subject" with "subject 2"
    And I fill in "Body" with "blablabla"
    And I select "Vasya" from "Recipient"
    And I press "Create"
    And I am logged in as Vasya
    And I am on the chat index page
    Then I should see "subject 2"

  Scenario: Display chats
    Given Alexey participates in the following chats:
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
      |subject 1|
      |subject 2|

  Scenario: Delete chat
    Given Alexey participates in the following chats:
      |subject|
      |subject 1|
      |subject 2|
      |subject 3|
      |subject 4|
    And I am on the chat index page
    When I delete the 3rd chat
    Then I should see the following chats:
      |Subject|
      |subject 1|
      |subject 2|
      |subject 4|
