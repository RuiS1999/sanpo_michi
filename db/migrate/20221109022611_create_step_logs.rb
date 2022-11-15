class CreateStepLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :step_logs do |t|
      t.integer     :user_id,         null: false
      t.integer     :calorie,         null: false
      t.integer     :number_of_step,  null: false
      t.integer     :walking_time,    null: false
      t.datetime    :start_time,      null: false

      t.timestamps
    end
  end
end
