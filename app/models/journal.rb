class Journal < ActiveRecord::Base
  has_many :issues
end
