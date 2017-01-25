require 'csv'

namespace :import do

	desc "Import pnms from csv"
	task users: :environment do
		CSV.foreach('../../csvs/round1pnms.csv') do |row|
			Pnm.create(name: row[0])
		end
	end
end