require_relative '../test_helper'

class UserCreatesASkillTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_creates_a_skill
    visit '/'
    click_link("New Skill")

    assert_equal "/skills/new", current_path

    fill_in "skill[name]", with: "Skill 1"
    fill_in "skill[status]", with: "lots of learning"
    click_button("Create Skill")

    assert_equal "/skills", current_path

    within("h3") do
       assert page.has_content?("Skill 1")
    end
  end
end
