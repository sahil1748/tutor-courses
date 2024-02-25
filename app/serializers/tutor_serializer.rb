class TutorSerializer < ApplicationSerializer
	attributes(
		:first_name, :last_name,
		:date_of_birth, :about,
		:primary_skill
	)
end