class CreateTontines < ActiveRecord::Migration[7.0]
  def change
    create_table :tontines do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.integer :contribution
      t.date :start_month
      t.date :payment_day
      t.integer :participants
      t.string :status

      t.timestamps
    end
  end
end
