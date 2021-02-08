class RemoveNameFromTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :types, :name
    add_column :types, :name, :json
  end
end
