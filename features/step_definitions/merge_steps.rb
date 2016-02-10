Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
    Article.create! article
  end
end

Given /^the following comments exist:$/ do |table|
  table.hashes.each do |comment|
    comment[:article] = Article.find_by_title comment[:article_title]
    comment.delete "article_title"
    Comment.create! comment
  end
end

# Merge articles field visible and not
Then /(?:|I )should (not |)see the merge articles field$/ do |arg_not|
  if arg_not == 'not ' then
    expect(page).to have_no_xpath('//input[@name = "merge_with"]')
  else
    expect(page).to have_xpath('//input[@name = "merge_with"]')
  end
end

# Merging the articles
When /(?:|I )merge "(.*?)" with "(.*?)"$/ do |title1, title2|
  article1 = Article.find_by_title title1
  article2 = Article.find_by_title title2

  step "I am logged into the admin panel"
  step "I go to the edit \"#{title1}\" page"
  fill_in 'merge_with', :with => article2.id
  click_button 'Merge'
end

# A field containing value
Then /^article (.*?) should contain "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

# A field's value is equal to
Then /^article (.*?) should be "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

# Comment by titile belongs to article by title
Then /^"(.*?)" should belong to "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
