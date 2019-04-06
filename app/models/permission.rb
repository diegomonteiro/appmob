class Permission < ApplicationRecord
	belongs_to :permissible, polymorphic: true
	has_many :resources, as: :recursive
end
