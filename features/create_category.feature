Feature: Write Articles
  As a blog administrator
  In order to categorize my articles
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create categories
    Given I am on the new category page
    When I fill in "category_name" with "Foobar"
    And I press "Save"
    Then I should be on the categories page
    Then I should see "Foobar"

  Scenario: Successfully edit a category
    Given I am on the new category page
    When I fill in "category_name" with "Foobar"
    And I press "Save"
    Given I am on the categories page
    And I follow "Foobar"
    When I fill in "category_name" with "Foobar_new"
    And I press "Save"
    Then I should be on the categories page
    Then I should see "Foobar_new"
