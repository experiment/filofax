class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :paper, index: true
      t.string :name
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
