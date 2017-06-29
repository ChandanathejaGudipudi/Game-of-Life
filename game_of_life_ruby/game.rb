#!/usr/bin/env ruby

require_relative 'world.rb'

class Game
	attr_accessor :world, :gen

	def initialize(r=5, c=5)
		@world = World.new(r, c)
		@gen = 0
	end

	def gen_next
		toggle_cells = []

		@world.arr_cells.each do |cell|
			active_neighbours = self.world.neighbours(cell)

			if(cell.active?)
				if(active_neighbours<2 || active_neighbours>3)
					toggle_cells << cell
				end
			
			else
				if(active_neighbours == 3)
					toggle_cells << cell
				end
			end
		end

		toggle_cells.each do |cell|
			self.world.matrix[cell.x][cell.y].toggle
		end

		@gen = @gen + 1;
		self.show()
	end

	def show
		i = 0
		while i < self.world.n_rows do
			j = 0
			while j < self.world.n_cols do
				cell = self.world.matrix[i][j]
				if(cell.active?)
					print "O "
				else
					print ". "
				end
				j = j+1
			end
			puts "\n"
			i = i+1
		end
	end

end

r = 5
c = 5
game = Game.new(r, c)

puts "Rows = #{game.world.n_rows} and columns = #{game.world.n_cols}\n"

puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
puts "\n"
puts "Generation No: #{game.gen}"
puts "\n"
game.show
puts "\n"
puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"

i = 1
while i<=10 do
	puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
	puts "\n"
	game.gen_next
	puts "\n"
	puts "Generation No: #{game.gen}"
	puts "\n"
	puts "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
	i = i+1
end



