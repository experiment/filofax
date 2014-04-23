class Issue < ActiveRecord::Base
  belongs_to :journal
  has_many :papers
end
