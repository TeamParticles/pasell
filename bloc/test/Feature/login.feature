Feature: Login functionality

  Scenario: When email and password are in specified format and loginbutton  is clicked 
      Given I have "emailfield" and "passwordfield" and "LoginButton"
      And I fill the "emailfield" field with "sus@gmailcom"
      And I fill the "passwordfield" field with "password"
      Then I tap the "LoginButton" button
      Then I should have "HomePage" on screen

      


      

      