class CreateStepLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :step_logs do |t|
      t.integer     :user_id, null: false
      t.integer     :calorie
      t.integer     :number_of_step
      t.integer     :walking_time
      t.datetime    :start_time

      t.timestamps
    end
  end
end
