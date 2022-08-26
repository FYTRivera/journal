class Task < ApplicationRecord
  validates :body, presence: true

  belongs_to :category
end
