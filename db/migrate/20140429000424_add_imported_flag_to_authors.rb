class AddImportedFlagToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :imported, :boolean, default: false
  end
end
