class Lesson < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :where, presence: true, length: { minimum: 3 }
end
