require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(players_name)
  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_name == players_name
            return player_stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_name == players_name
            return player_stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if attribute == :team_name && data == team_name
        return team_info[:colors]
      end
    end
  end
end

def team_names
  teams = []

  game_hash.each do |location, info|
      teams << info[:team_name]
  end

  teams
end

def player_numbers(team_name)
  player_numbers = []

  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if team_name == data
        team_info[:players].each do |player, stats|
          player_numbers << stats[:number]
        end
      end
    end
  end

  player_numbers.sort()
end

def player_stats(players_name)
  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_name == players_name
            return player_stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0
  big_shoe_rebounds = 0

  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_stats[:shoe] > largest_shoe_size
            largest_shoe_size = player_stats[:shoe]
            big_shoe_rebounds = player_stats[:rebounds]
          end
        end
      end
    end
  end

  big_shoe_rebounds
end

def most_points_scored
  most_points = 0
  player_w_most_points = nil

  game_hash.each do |team_location, team_info|
    team_info.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_stats[:points] > most_points
            most_points = player_stats[:points]
            player_w_most_points = player_name
          end
        end
      end
    end
  end

  player_w_most_points
end

def winning_team
  home_points = 0
  away_points = 0

  game_hash.each do |team_location, team_info|
    if team_location == :home
      team_info.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            home_points += stats[:points]
          end
        end
      end
    else team_location == :away
      team_info.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            away_points += stats[:points]
          end
        end
      end
    end
  end

  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end
