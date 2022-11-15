class CreateCalorieCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calorie_calculations do |t|
      t.integer     :mets,          null: false
      t.integer     :weight,        null: false
      t.integer     :walking_time,  null: false

      t.timestamps
    end
  end
end
