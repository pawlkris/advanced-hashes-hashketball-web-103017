# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  return game_hash
end

def num_points_scored(name)
  game_hash = game_hash()
  home = game_hash[:home][:players].keys
  away = game_hash[:away][:players].keys
  if home.include?(name)
    return game_hash[:home][:players][name][:points].to_i
  else
    return game_hash[:away][:players][name][:points].to_i
  end
end

def shoe_size(name)
  game_hash = game_hash()
  home = game_hash[:home][:players].keys
  away = game_hash[:away][:players].keys
  if home.include?(name)
    return game_hash[:home][:players][name][:shoe].to_i
  else
    return game_hash[:away][:players][name][:shoe].to_i
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  numbers = []
  if game_hash[:home][:team_name] == team
    numbers = game_hash[:home][:players].keys.collect do |x|
      game_hash[:home][:players][x][:number]
    end
  else
    numbers = game_hash[:away][:players].keys.collect do |x|
    game_hash[:away][:players][x][:number]
    end
  end
  return numbers
end

def player_stats(player)
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player]
  else
    return game_hash[:away][:players][player]
  end
end

def big_shoe_rebounds

    biggest = nil
    shoes = {}

    game_hash.each do |location, data|
      data.each do |key, value|
        if key == :players
          value.each do |name, stats|
            stats.each do |stat, value|
              shoes[name] = game_hash[location][:players][name][:shoe] if stat == :shoe
            end
          end
        end
      end
    end

    shoes.each {|player, size| biggest = player if size == shoes.values.max}
    return game_hash[:home][:players][biggest][:rebounds]
end
