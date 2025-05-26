class CreateServers < ActiveRecord::Migration[8.0]
  def change
    create_table :servers do |t|
      t.string :ip_address
      t.string :name
      t.string :authentication_token
      t.integer :server_status, default: 1, null: false

      t.timestamps
    end
  end
end
