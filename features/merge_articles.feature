Feature: Merge Articles
	As a blog administrator
  In order to reduce repeting articles
  I want to be able to merge two articles into one

  Background:
    Given the blog is set up
    And the following articles exist:
    | title     | body               | author |  
    | Article 1 | The article 1 text | user1  |  
    | Article 2 | The article 2 text | user2  |  
    And the following comments exist:
    | title     | author | body                  | article_title |  
    | Comment 1 | user1  | Is a great article    | Article 1     |  
    | Comment 2 | user2  | Is a mediocre article | Article 2     |  

	Scenario: Merge articles field shown
		Given I am logged into the admin panel
		When I go to the edit "Article 1" page
		Then I should see the merge articles field

	Scenario: Merge articles field not shown when not admin
		Given I am logged in as not admin
		When I go to the edit "Article 1" page
		Then I should not see the merge articles field

	Scenario: Merge articles field not shown when creating new article
		Given I am logged into the admin panel
		When I go to the new article page
		Then I should not see the merge articles field

	Scenario: Merged article has the text of the both articles
		When I merge "Article 1" with "Article 2"
		Then I should be on edit "Article 1" page
		And article text should contain "The article 1 text"
		And article text should contain "The article 2 text"

	Scenario: Merged article has one of the original authors as an author
		When I merge "Article 1" with "Article 2"
		Then I should be on edit "Article 1" page
		And article author should be "user1"

	Scenario: Merged article has one of the original titles as an title
		When I merge "Article 1" with "Article 2"
		Then I should be on edit "Article 1" page
		And article title should be "Article 1"

	Scenario: Merged article has all the comments from both articles
		When I merge "Article 1" with "Article 2"
		Then "Comment 1" should belong to "Article 1"
		And "Comment 2" should belong to "Article 1"


