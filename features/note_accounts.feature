Feature: Allow system and employees to note accounts
  As an employee or the system
  In order to inform customers of changes to there account
  I want to be able to add notes to an account
  
  Scenario: Employee views new note page
    Given a user called joe with a password of password
    And a user called bob with a password of password
    When I log in as joe using password password
    And I go to /users/bob/notes
    Then I should see "subject"
    And I should see "hi"
    And I should see "what's up"
    
  Scenario: Employee adds a note
    Given a user called joe with a password of tacobell
    When I log in as joe using password tacobell
    And I fill in "Level" with "notice"
    And I fill in "Subject" with "hi"
    And I fill in "Body" with "what's up"
    And I press "Save"
    Then I should see "notice"
    And I should see "hi"
    And I should see "what's up"
    
  