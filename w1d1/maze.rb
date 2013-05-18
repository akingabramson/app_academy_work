class Maze

	attr_accessor :map, :lines, :position, :end_point, :spots

	def initialize
		@lines = File.readlines("./maze.txt")
		@map = []

		make_map
		set_start_and_end_point
		run_game
	end

	def run_game
		until @position == @end_point
			move
		end
		p "BALLGAME"
		#call again until at end position
	end

	def move
		find_movable_places
		 #randomly pick a space to move to
		chosen_spot = @spots.first
		@position.row = chosen_spot[0]
		@position.column = chosen_spot[1]
		@position = [@position.row,@position.column]
		mark_as_moved
		print_map
		p @position
	end

	def mark_as_moved
		@map[@position[0]][@position[1]] = "X"
	end

	def find_movable_places
		@spots = []
		@spots << [@position[0], @position[1]+1] #spots[0] = right
		@spots << [@position[0]-1, @position[1]] #spots[1] = up
		@spots << [@position[0]+1, @position[1]] #spots[2] = down
		@spots << [@position[0], @position[1]-1] #spots[3] = left


		@spots.each_with_index do |spot, index|
			if @map[spot[0]][spot[1]] == "*" || @map[spot[0]][spot[1]] == "X"
				@spots.delete_at(index)
			end
		end
	end

	def show_spot_on_map
		@map[@position[0]][@position[1]] = "&"
		print_map
	end

	def set_start_and_end_point
		@map.each_with_index do |row, row_number|
			row.each_with_index do |point, col_number|
				if point == "S"
					@position = [row_number, col_number]
				end
				if point == "E"
					@end_point = [row_number, col_number]
				end
			end
		end
	end

	def make_map
		add_map_rows
		lines.each_with_index do |line, row|
			line = line.strip
			items = line.split(//)
			items.each_with_index do |space, column|
				map[row][column] = space
			end
		end
	end

	def add_map_rows
		@lines.length.times do
			@map.push([])
		end
	end

	def print_map
		@map.each do |row|
			p row
		end
	end
end


m = Maze.new


