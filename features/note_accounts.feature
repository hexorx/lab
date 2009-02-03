Feature: Allow employees to note accounts
  As an employee
  In order to inform customers of changes to there account
  I want to be able to add notes to an account
  
  Scenario: Employee views new note page
    Given a user called joe with a password of password
    And I am on the profile for bob
    When I log in as joe using password password
    And I go to add note
    Then I should see "Level"
    And I should see "Subject"
    And I should see "Body"
    And I should see "Save"
    
  Scenario: Employee adds a note
    Given a user called joe with a password of password
    And I am on the profile for bob
    When I log in as joe using password password
    And I go to add note
    And I fill in "Level" with "notice"
    And I fill in "Subject" with "hi"
    And I fill in "Body" with "what's up"
    And I press "Save"
    Then I should see "notice"
    And I should see "hi"
    And I should see "what's up"
    
  