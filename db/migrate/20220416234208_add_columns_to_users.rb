class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :title, :string
    add_column :users, :start_date, :date
    add_column :users, :end_date, :date
    add_column :users, :all_day, :boolean
    add_column :users, :memo, :text

  end
end
