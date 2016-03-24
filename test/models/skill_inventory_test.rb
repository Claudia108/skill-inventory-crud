require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_create_creates_a_new_skill
    skill_inventory.create({
      :name => "Skill 1",
      :status => "learning process"
      })

      skill = skill_inventory.find(1)

      assert_equal "Skill 1", skill.name
      assert_equal "learning process", skill.status
      assert_equal 1, skill.id
  end

  def test_all_shows_all_skills
    create_skills(3)
    all = skill_inventory.all

    assert_equal Array, all.class
    assert_equal 3, all.size
    assert_equal "Skill Name 1", all[0].name
    assert_equal "Skill Name 2", all[1].name
    assert_equal "Skill Name 3", all[2].name
  end

  def test_find_shows_skill_by_id
    create_skills
    skill = skill_inventory.find(2)

    assert_equal Skill, skill.class
    assert_equal "Skill Name 2", skill.name
    assert_equal "Skill Status 2", skill.status
    assert_equal 2, skill.id
  end

  def test_udpdate_saves_new_information_to_skill
    create_skills

    skill = skill_inventory.find(2)
    assert_equal Skill, skill.class
    assert_equal "Skill Name 2", skill.name
    assert_equal "Skill Status 2", skill.status
    assert_equal 2, skill.id

    updated_information = {name: "Skill updated", status: "Status updated"}
    skill_inventory.update(2, updated_information)
    skill = skill_inventory.find(2)

    assert_equal Skill, skill.class
    assert_equal "Skill updated", skill.name
    assert_equal "Status updated", skill.status
    assert_equal 2, skill.id
  end

  def test_destroy_removes_skill
    create_skills
    all_skills = skill_inventory.all

    assert_equal 2, all_skills.size
    assert all_skills.any? { |skill| skill.name == "Skill Name 2"}

    skill_inventory.destroy(2)
    all_skills = skill_inventory.all

    assert_equal 1, all_skills.size
    refute all_skills.any? { |skill| skill.name == "Skill Name 2"}
  end
end
