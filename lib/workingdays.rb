require 'date'

module WorkingDays
	def self.calculateremainingdaysinmonth #(from, to)
		workdays = (Date.today .. Date.civil(Date.today.year, Date.today.month, -1)).select{ |day| (1..5).include?(day.wday) }.size
		puts workdays
	end
	def self.calculatingworkingdaysbetween(from,to)
		# workdays = (from..to).select{ |day| (1..5).include?(day.wday) }.size
		holidays = Holiday.all.map(&:date)
		workdays = 0
		(from..to).each do |day|
			unless holidays.include?(day)
				workdays += 1 if (1..5).include?(day.wday)
			end
		end

		puts workdays
	end
end