class UserSubscriptionTypesTable < ActiveRecord::Migration
  def up
  	create_table :subscription_types_users, :id => false do |t|
        t.references :subscription_type
        t.references :user
    end
  end

  def down
  	drop_table :subscription_types_users
  end
end
