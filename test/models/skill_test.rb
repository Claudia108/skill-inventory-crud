require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_assigns_attributes_correctly
    skill = Skill.new({
      :name   => "Testing",
      :status => "Good at",
      :id     => 1
      })

      assert_equal "Testing", skill.name
      assert_equal "Good at", skill.status
      assert_equal 1, skill.id
  end
end
