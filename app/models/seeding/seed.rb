require 'csv'

test = CSV.read("../../../db/test.csv")

CSV.foreach('test.csv') do |row|
	row.each do |cell|
		puts cell
	end
end

