require 'pry'

# Write your code here!
def game_hash
	{
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1
				},
				"Reggie Evans" => {
					number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7
				},
				"Brook Lopez" => {
					number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15
				},
				"Mason Plumlee" => {
					number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5
				},
				"Jason Terry" => {
					number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1
				}
			}
		},
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"],
			players: {
				"Jeff Adrien" => {
					number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2
				},
				"Bismak Biyombo" => {
					number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10
				},
				"DeSagna Diop" => {
					number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5
				},
				"Ben Gordon" => {
					number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0
				},
				"Brendan Haywood" => {
					number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12
				}
			}
		}
	}
end


def num_points_scored(name)
	game_hash.each do |location, team_info|		
		if team_info[:players].keys.include? name
			return team_info[:players][name][:points]
		end
	end
end

def shoe_size(name)
	game_hash.each do |location, team_info|		
		if team_info[:players].keys.include? name
			return team_info[:players][name][:shoe]
		end
	end
end


def team_colors(team)
	game_hash.each do |location, team_info|
		if team_info[:team_name] == team
			return team_info[:colors]
		end
	end
end


def team_names
	result = []
	game_hash.each do |location, team_info|
		result << team_info[:team_name]
	end
	result
end


def player_numbers(team)
	result = []
	game_hash.each do |location, team_info|
		if team_info[:team_name] == team
			team_info[:players].each do |name, stats|
				result << stats[:number]
			end
		end
	end
	result
end


def player_stats(name)
	game_hash.each do |location, team_info|		
		if team_info[:players].keys.include? name
			return team_info[:players][name]
		end
	end
end


def big_shoe_rebounds
	bigfoot = ""
	bigshoe = 0
	game_hash.each do |location, team_info|
		team_info[:players].each do |name, stat|
			if stat[:shoe] > bigshoe
				bigshoe = stat[:shoe]
				bigfoot = name
			end
		end
	end

	game_hash.each do |location, team_info|		
		if team_info[:players].keys.include? bigfoot
			return team_info[:players][bigfoot][:rebounds]
		end
	end

end


def most_points_scored
	mvp = ""
	mvp_points = 0
	game_hash.each do |location, team_info|
		team_info[:players].each do |name, stat|
			if stat[:points] > mvp_points
				mvp_points = stat[:points]
				mvp = name
			end
		end
	end

	game_hash.each do |location, team_info|		
		if team_info[:players].keys.include? mvp
			return team_info[:players][mvp][:rebounds]
		end
	end
end


def winning_team
	team_points = {}
	game_hash.each do |location, team_info|
		total_points = 0
		team_info[:players].each do |name, stat|
			total_points += stat[:points]
		end
		team_points[team_info[:team_name]] = total_points
	end
	
	highscore = team_points.values.sort[1]
	team_points.select {|team, points| points == highscore}.keys.join
end


def player_with_longest_name
	long_name_player = ""
	char_count = 0
	game_hash.each do |location, team_info|
		team_info[:players].each do |name, stat|
			if name.length > char_count
				char_count = name.length
				long_name_player = name
			end
		end
	end
	long_name_player
end


def long_name_steals_a_ton?
	player_with_longest_name

	thief = ""
	stolen = 0
	game_hash.each do |location, team_info|
		team_info[:players].each do |name, stat|
			if stat[:steals] > stolen
				stolen = stat[:steals]
				thief = name
			end
		end
	end

	return thief == player_with_longest_name

end
