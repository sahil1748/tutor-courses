class AddCourseIdToTutors < ActiveRecord::Migration[7.1]
  def change
    add_reference :tutors, :course, foreign_key: true, null: true
  end
end
