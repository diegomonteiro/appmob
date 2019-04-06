class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :confirmable, :validatable
  has_many :permissions, as: :permissible
  has_paper_trail
end
