class Resource < ApplicationRecord
	belongs_to :recursive, polymorphic: true
	has_paper_trail
end
