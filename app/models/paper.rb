class Paper < ActiveRecord::Base
  belongs_to :issue
  has_many :authors

  validates :issue, presence: true
end
