class CreateTutors < ActiveRecord::Migration[7.1]
  def change
    create_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.text :about
      t.string :primary_skill

      t.timestamps
    end
  end
end
