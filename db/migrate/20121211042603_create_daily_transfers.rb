class CreateDailyTransfers < ActiveRecord::Migration
  def change
    create_table :daily_transfers do |t|
      t.references :subscription
      t.date :date
      t.integer :lender_id
      t.integer :borrower_id
      t.boolean :payment_status, :default => false

      t.timestamps
      add_index :daily_transfers, :date
    end
  end
end
