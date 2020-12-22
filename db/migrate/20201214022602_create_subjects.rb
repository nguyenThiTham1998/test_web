class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :time
      t.text :description
      t.boolean :auto_check
      t.integer :public
      t.datetime :start_at
      t.datetime :end_at
      t.references :user, null: false, foreign_key: true
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

