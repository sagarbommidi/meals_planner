class CreateSubscriptionTypes < ActiveRecord::Migration
  def change
    create_table :subscription_types do |t|
      t.date :month
      t.integer :number_of_days
      t.integer :amount_per_day, :default => 45

      t.timestamps
    end

    add_index :subscription_types, :month
  end
end
