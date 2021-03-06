Feature: posting
    In order to enlighten humanity for the good of society
    As a rock star
    I want to tell the world I am eating a yogurt
    
    Scenario: post to all aspects
      Given I am signed in
        And I have an aspect called "Family"
        And I am on the home page
      When I click share across aspects
        And I fill in "status_message_message" with "I am eating a yogurt"
        And I press "Share"
        
        And I follow "Family"
      Then I should see "I am eating a yogurt"
      
    Scenario Outline: post to one aspect
      Given I am signed in
        And I have an aspect called "PostTo"
        And I have an aspect called "DidntPostTo"
        And I am on the home page
      When I follow "PostTo"
        And I fill in "status_message_message" with "I am eating a yogurt"
        And I press "Share"
        
        And I follow "<aspect>"
      Then I should <see> "I am eating a yogurt"
      
      Examples:
        | aspect      | see     |
        | PostTo      | see     |
        | DidntPostTo | not see |
