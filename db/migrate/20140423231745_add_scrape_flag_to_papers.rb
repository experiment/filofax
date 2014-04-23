class AddScrapeFlagToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :scraped, :boolean, default: false
  end
end
