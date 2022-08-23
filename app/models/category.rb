class Category < ApplicationRecord
    validates :name, presence: true,
                    length: { maximum: 20}
    validates :description, presence: true,
                    length: { minimum: 10, maximum: 100}

    has_many :tasks, dependent: :destroy
end
