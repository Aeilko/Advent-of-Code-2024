require_relative '../lib/aoc'

module Day01
	extend AOC::Day

	@num = 1
	@ans_test1 = 11
	@ans_test2 = 31

	def self.parse_input(input)
		left = []
		right = []
		input.lines.each do |line|
			l, r = line.split(" ")
			left << l.to_i
			right << r.to_i
		end

		[left, right]
	end

	def self.solve_part1(input)
		left, right = parse_input(input)
		left.sort!
		right.sort!

		r = 0
		left.each_with_index do |val, i|
			r += (val - right[i]).abs
		end

		r
	end

	def self.solve_part2(input)
		left, right = parse_input(input)
		counts = right.tally

		r = 0
		left.each do |val|
			c = counts[val] || 0
			r += c*val
		end

		r
	end
end

Day01.run
