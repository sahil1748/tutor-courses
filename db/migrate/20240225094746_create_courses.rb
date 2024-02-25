class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :level

      t.timestamps
    end
  end
end
