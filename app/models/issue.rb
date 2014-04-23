class Issue < ActiveRecord::Base
  belongs_to :journal
  has_many :papers
  has_many :authors, through: :papers

  validates :url, presence: true, uniqueness: true
end
