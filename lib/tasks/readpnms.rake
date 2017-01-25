require 'csv'

namespace :import do

	desc "Import pnms from csv"
	task users: :environment do
		filename = File.join Rails.root, "csvs/round1pnms.csv"
		CSV.foreach(filename) do |row|
			Pnm.create(name: row[0])
		end
	end
end