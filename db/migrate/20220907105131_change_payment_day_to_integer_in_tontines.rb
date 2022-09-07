class ChangePaymentDayToIntegerInTontines < ActiveRecord::Migration[7.0]
  def change
    remove_column :tontines, :payment_day
    add_column :tontines, :payment_day, :integer
  end
end
