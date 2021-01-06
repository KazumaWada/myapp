class AddYearToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :year, :string
  end
end
