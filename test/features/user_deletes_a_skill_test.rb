require_relative '../test_helper'

class UserDeletesASkillTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_delete_a_skill
    skill_inventory.create({
      name: "Capybara",
      status: "Learning by doing"
      })

      visit "/skills"

      within("h3") do
        assert page.has_content?("Capybara")
      end

      click_button("delete")

      assert_equal "/skills", current_path
      refute page.has_content?("Capybara")
  end
end
