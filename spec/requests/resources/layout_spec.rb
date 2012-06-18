require 'spec_helper'

feature "Backend layout interaction" do

  scenario "Toggle groups display in edit form", js: true do
    # Given I have a book
    book = create(:book)

    # When I visit the edit action for that book
    visit "/backend/books/#{book.id}/edit"
    # Then I should see a field in a group
    find('label', text: 'Description').should be_visible

    # When I click the fields group name
    click_on "Resource Fields"
    # And I wait the JS animation
    wait_until_animation_end
    # Then the fields in that group should disappear
    lambda { find('label', text: 'Description') }.should raise_error(Capybara::ElementNotFound)
  end

end
