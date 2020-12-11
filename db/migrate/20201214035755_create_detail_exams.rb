class CreateDetailExams < ActiveRecord::Migration[6.0]
  def change
    create_table :detail_exams do |t|
      t.references :exam, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
