class AddBorrowerNameToDailyTransfers < ActiveRecord::Migration
  def change
    add_column :daily_transfers, :borrower_name, :string
  end
end
