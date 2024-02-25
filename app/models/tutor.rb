class Tutor < ApplicationRecord
	validates :first_name, :last_name,
						:date_of_birth, :primary_skill,
						presence: true
end
