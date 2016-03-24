require 'yaml/store'

class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  # def self.database
  #   @database ||= YAML::Store.new("db/skill_inventory")
  # end

  def create(skill)
    database.from(:skills).insert(skill)
  end

  def all
    database.from(:skills).map { |data| Skill.new(data) }
  end

  # def raw_skill(id)
  #   raw_skills.find { |skill| skill["id"] == id }
  # end

  def find(id)
    raw_skill = database.from(:skills).where(:id => id).to_a.first
    Skill.new(raw_skill)
  end

  def update(id, skill)
    # database.from(:skills).where(:id => id).update(:name => skill[:name], :status => skill[:status])
    database.from(:skills).where(:id => id).update(skill)
  end

  def destroy(id)
    database.from(:skills).where(:id => id).delete
  end

  def delete_all
    database.from(:skills).delete
  end
end
