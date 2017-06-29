#!/usr/bin/env ruby

require_relative 'cell.rb'

#class to define the world matrix containing all the cells
class World

	#attribues of the world : number of rows and columns, the cell matrix and storing all the cells in an array for eay access
	attr_accessor :n_rows, :n_cols, :matrix, :arr_cells

	#constructor to initialize all the values and generate a random matrix
	def initialize(r=5, c=5)
		@n_rows = r
		@n_cols = c
		@arr_cells = []

		@matrix = Array.new(n_rows) do |i|
			Array.new(n_cols) do |j|
				cell = Cell.new(i, j)
				cell.active = [true, false].sample
				arr_cells << cell
				cell
			end
		end
	end

	#find all the active neighbours of a given cell
	def neighbours(cell)
		active_neighbours = []

		#eastern neighbour
		if(cell.y > 0)
			nghbr = self.matrix[cell.x][cell.y-1]
			if nghbr.active?
				active_neighbours << nghbr
			end
		end

		#western neighbour
		if(cell.y < n_cols-1)
			nghbr = self.matrix[cell.x][cell.y+1]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		#northern neighbour
		if(cell.x > 0)
			nghbr = self.matrix[cell.x-1][cell.y]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		#southern neighbour
		if(cell.x < n_rows-1)
			nghbr = self.matrix[cell.x+1][cell.y]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		#north-eastern neighbour
		if(cell.x > 0 && cell.y > 0)
			nghbr = self.matrix[cell.x-1][cell.y-1]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		#north-western neighbour
		if(cell.x > 0 && cell.y < n_cols-1)
			nghbr = self.matrix[cell.x-1][cell.y+1]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		#south-eastern neighbour
		if(cell.x < n_rows-1 && cell.y > 0)
			nghbr = self.matrix[cell.x+1][cell.y-1]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		#south-western neighbour
		if(cell.x < n_rows-1 && cell.y < n_cols-1)
			nghbr = self.matrix[cell.x+1][cell.y+1]
			if(nghbr.active?)
				active_neighbours << nghbr
			end
		end

		return active_neighbours.count
	end

end

