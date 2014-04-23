class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.references :issue, index: true
      t.string :doi
      t.string :title
      t.datetime :published_at
      t.string :url
      t.string :keywords, array: true, default: []

      t.timestamps
    end
  end
end
