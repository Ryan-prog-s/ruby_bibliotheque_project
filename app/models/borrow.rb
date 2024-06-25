class Borrow < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :book, uniqueness: { scope: :ended_at, message: "The book is already borrowed" }
end