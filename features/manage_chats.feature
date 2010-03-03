Feature: Manage chats
  In order to test my mad rails skills
  I, Codesnik
  want to create something like moikrug.ru messaging

  Scenario: Register new chat
    Given I am on the new chat page
    When I fill in "Subject" with "subject 1"
    And I press "Create"
    Then I should see "subject 1"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity or Selenium2 (webdriver) when pages rely on
  # Javascript events. Only Culerity supports confirmation dialogs.
  #
  # Since Culerity and Selenium2 has some overhead, Cucumber-Rails will detect 
  # the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn off this emulation by tagging your scenario with @selenium, 
  # @culerity, @celerity or @javascript. (See the Capybara documentation for 
  # details about those tags). If any of these tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails'' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
  # TODO: Verify with Rob what this means: The rack driver will detect the 
  # onclick javascript and emulate its behaviour without a real Javascript
  # interpreter.
  #
  Scenario: Delete chat
    Given the following chats:
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
