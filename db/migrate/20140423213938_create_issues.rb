class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :journal, index: true
      t.string :url

      t.timestamps
    end
  end
end
