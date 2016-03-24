require_relative '../test_helper'

class UserEditsASkillTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_an_existing_skill
    visit "/"
    click_link("New Skill")

    assert_equal "/skills/new", current_path

    fill_in "skill[name]", with: "Capybara"
    fill_in "skill[status]", with: "Learning by doing"
    click_button("Create Skill")

    visit "/skills"
    click_link("edit")

    assert_equal "/skills/1/edit", current_path

    fill_in "skill[name]", with: "Fun"
    fill_in "skill[status]", with: "Sleeping, dancing, reading"
    click_button("update")

    assert_equal "/skills/1", current_path

    within("h1") do
      assert page.has_content?("Fun")
    end
  end
end
