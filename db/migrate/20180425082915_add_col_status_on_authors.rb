class AddColStatusOnAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :status, :boolean, default: false
  end
end
