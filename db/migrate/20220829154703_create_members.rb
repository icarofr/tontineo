class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.belongs_to :tontine, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :position
      t.string :status

      t.timestamps
    end
  end
end
