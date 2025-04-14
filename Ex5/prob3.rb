module CommonAbilities
  def move
    puts "#{self.class} moves swiftly!"
  end

  def attack
    puts "#{self.class} attacks the enemy!"
  end

  def defend
    puts "#{self.class} defends against the attack!"
  end
end

module HealingAbility
  def heal
    puts "#{self.class} heals and regains strength!"
  end
end

module PoisonAbility
  def poison
    puts "#{self.class} poisons the enemy!"
  end
end

module LevelUp
  def level_up
    @attack_power += 10
    @defense_power += 5
    puts "#{self.class} levels up! Attack: #{@attack_power}, Defense: #{@defense_power}"
  end
end

class Character
  attr_accessor :attack_power, :defense_power

  def initialize(attack_power = 50, defense_power = 30)
    @attack_power = attack_power
    @defense_power = defense_power
  end
end

class Hero < Character
  include CommonAbilities
  include HealingAbility
  include LevelUp
end

class Villain < Character
  include CommonAbilities
  include PoisonAbility
  include LevelUp
end

class Monster < Character
  include CommonAbilities
  include LevelUp
end

# Creating instances of characters
hero = Hero.new
villain = Villain.new
monster = Monster.new

# Demonstrating abilities
hero.move
hero.attack
hero.defend
hero.heal
hero.level_up

villain.move
villain.attack
villain.defend
villain.poison
villain.level_up

monster.move
monster.attack
monster.defend
monster.level_up
