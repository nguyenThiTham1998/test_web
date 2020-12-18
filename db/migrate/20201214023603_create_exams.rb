class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.integer :time
      t.boolean :checked
      t.string :examee_name
      t.date :examee_date_of_birth
      t.string :examee_organization
      t.text :examee_more_detail
      t.integer :user_id
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
