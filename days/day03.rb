require_relative '../lib/aoc'

module Day03
	extend AOC::Day

	@num = 3
	@ans_test1 = 161
	@ans_test2 = 48

	def self.mul(str)
		str.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map do |a, b|
			a.to_i * b.to_i
		end.sum
	end

	def self.solve_part1(input)
		return mul(input)
	end

	def self.do_to_dont(str)
		r = 0
		s = str.split("don't()", 2)
		if s.length == 2
			ss = s[1].split("do()", 2)
			r += do_to_dont(ss[1]) if ss.length == 2
		end

		return r + mul(s[0])
	end

	def self.solve_part2(input)
		return do_to_dont(input)
	end
end

Day03.run
