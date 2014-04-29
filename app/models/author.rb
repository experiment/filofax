class Author < ActiveRecord::Base
  belongs_to :paper

  scope :us_based, -> {
    where("location LIKE '%USA%' OR email LIKE '%.edu'") }
  scope :unimported, -> { where(imported: false) }

  def imported!
    update_attributes! imported: true
  end
end
