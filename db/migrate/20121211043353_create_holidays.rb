class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :date
      t.string :description

      t.timestamps

      add_index :holidays, :date
    end
  end
end
