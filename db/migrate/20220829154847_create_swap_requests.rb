class CreateSwapRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :swap_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
  end
end
