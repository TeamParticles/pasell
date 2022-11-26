Feature: Signup functionality

  Scenario: when username,email,password and conform password  are in specified format and register is clicked
      Given I have "userfield" "emailfield" "passwordfield" and "conformpassword" and "RegisterButton"
      And  I fill the "userfield" field with "sushmita"
      And I fill the "emailfield" field with "sus@gmail.com"
      And I fill the "passwordfield" field with "password"
      And I fill the "conformpassword" field with "password"
      Then I tap the "RegisterButton" button
      Then I should have "LoginButton" on screen






