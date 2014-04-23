class Journal < ActiveRecord::Base
  has_many :issues
  has_many :papers, through: :issues
  has_many :authors, through: :papers
end
