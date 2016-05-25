require 'csv'

file = CSV.read("#{Dir.home}/src/liveability/data/leefbaarometer_2.0.csv", {:col_sep => ";"})

file.each do |row|
	Commune.create name: row[4], code: row[3] unless Commune.exists?(code: row[3])
end

file.each do |row|
	commune = Commune.find_by_name(row[4])
	begin
		if !row[2].nil?
			Neighbourhood.create :commune_id => commune['id'],
				name: row[2],
				liveability_score_2002: row[7],
				liveability_score_2008: row[8],
				liveability_score_2012: row[9],
				liveability_score_2014: row[10],
				houses_score_2012: row[12],
				inhabitants_score_2012: row[13],
				services_score_2012: row[14],
				safety_score_2012: row[15],
				fysical_environment_score_2012: row[16],
				houses_score_2014: row[17],
				inhabitants_score_2014: row[18],
				services_score_2014: row[19],
				safety_score_2014: row[20],
				fysical_environment_score_2014: row[21]
		end
	rescue
		"commune not found"
	end
end
