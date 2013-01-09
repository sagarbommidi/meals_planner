class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
			t.references :subscription_type
      t.integer :total_amount
      t.boolean :payment_status, :default => false

      t.timestamps
    end
    add_index :subscriptions, :user_id
  end
end
