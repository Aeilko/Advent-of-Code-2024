require_relative '../lib/aoc'

module Day02
	extend AOC::Day

	@num = 2
	@ans_test1 = 2
	@ans_test2 = 4

	def self.parse_input(input)
		levels = []
		input.lines.each do |line|
			r = []
			line.split(" ").each do |word|
				r << word.to_i
			end
			levels << r
		end
		levels
	end

	def self.test_group(level)
		dir = 0
		safe = true
		level.each_cons(2) do |a, b|
			# Check step size
			d = (b-a).abs
			if d == 0 or d > 3
				safe = false
				break
			end

			# Check if all directions are the same
			d = (b-a)/(b-a).abs
			if dir == 0
				dir = d
			else
				if dir != d
					safe = false
					break
				end
			end
		end
		safe
	end

	def self.solve_part1(input)
		levels = parse_input(input)

		r = 0
		levels.each do |level|
			r += 1 if test_group(level)
		end

		return r
	end

	def self.solve_part2(input)
		levels = parse_input(input)

		r = 0
		levels.each do |level|
			if test_group(level)
				r += 1
				next
			end

			level.each_with_index do |_, i|
				l = level.dup
				l.delete_at(i)
				if test_group(l)
					r += 1
					break
				end
			end
		end

		return r
	end
end

Day02.run
