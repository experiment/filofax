class AddScrapeFlagToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :scraped, :boolean, default: false
  end
end
