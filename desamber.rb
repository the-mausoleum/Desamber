# encoding: utf-8
#: {{Desamber}} is a time conversion Class from Gregorian to Desamber.
# Usage - Desamber.new("2015-08-19").formatted

require 'date'

class Desamber

	def initialize(date = Date.today.to_s)
		@date = date
	end

	def dict
		return ['Unesamber', 'Dutesamber', 'Trisesamber', 'Tetresamber', 'Pentesamber', 'Hexesamber', 'Sevesamber', 'Octesamber', 'Novesamber', 'Desamber', 'Undesamber', 'Dodesamber', 'Tridesamber']
	end

	def month
		return @date[5,2].to_i
	end

	def day
		return @date[8,2].to_i
	end

	def year
		return @date[0,4].to_i
	end

	def span
		return Date.new(y=year,m=month,d=day).yday
	end

	def equalMonth
		if span >= 365 then return "" end
		return (span/28.to_f).ceil
	end

	def equalDay
		if span == 365 then return "Year Day" end
		if span == 366 then return "Leap Day" end
		return (span % 28) == 0 ? 28 : span % 28
	end

	def formatted
		return "#{dict[equalMonth-1]} #{equalDay}, #{year}"
	end

end