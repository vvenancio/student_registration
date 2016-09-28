class CreateClassroom < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.datetime :entry_at

      t.timestamps null: false
    end

    add_index :classrooms, [:student_id, :course_id], unique: true
  end
end
