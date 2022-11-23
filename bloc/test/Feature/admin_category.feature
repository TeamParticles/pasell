Feature: Admin categories functionality

  Scenario: when items are selected as per categories  and add button is clicked
      Given I am at admin dashboard
      And  I click  on "Manage categories" 
      And I select the items on "All Categories"    
      Then I tap the "Add" button
      Then I should have "AddAdminCategory" on screen



    






