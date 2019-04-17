class Vote < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_paper_trail
end
