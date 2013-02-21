class ModifyAmountPerDay < ActiveRecord::Migration
  def up
    change_column :subscription_types, :amount_per_day, :integer, :default => 50
  end

  def down
  end
end
