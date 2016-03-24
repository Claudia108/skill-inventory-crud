ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = SkillInventoryApp

module TestHelpers
  def teardown
    skill_inventory.delete_all
    super
  end

  def skill_inventory
    database = Sequel.sqlite('db/skill_inventory_test.sqlite')
    @skill_inventory ||= SkillInventory.new(database)
  end

  def create_skills(num=2)
    num.times do |i|
      skill_inventory.create({
        :name => "Skill Name #{i + 1}",
        :status => "Skill Status #{i + 1}"
      })
    end
  end
end
