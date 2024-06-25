class Book < ApplicationRecord
    has_many :borrows
    has_many :users, through: :borrows
  end