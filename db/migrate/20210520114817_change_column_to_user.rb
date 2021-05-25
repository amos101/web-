class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  add_column :users, :provider, :string
  add_column :users, :uid, :string
  add_column :users, :name, :string
  def change
  end
end
