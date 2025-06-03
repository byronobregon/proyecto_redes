class CreateServerLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :server_logs do |t|
      t.references :server, null: false, foreign_key: true
      t.time :time
      t.float :cpu_usage, default: 0
      t.float :memory_usage, default: 0

      t.timestamps
    end
  end
end
