#!/usr/bin/env ruby

#class to define the structure of each cell in the grid
class Cell

	#attributes of each cell object : its coordinates and the state
	attr_accessor :active, :x, :y

	#constructor, by default the cell is inactive initially
	def initialize(a=0, b=0)
		@x = a
		@y = b
		@active = false
	end

	#to check if the cell is active
	def active?
		if(active)
			return true
		else
			return false
		end
	end

	#toggle the state of a cell
	def toggle
		if(@active)
			@active = false
		else
			@active = true
		end
	end
end

