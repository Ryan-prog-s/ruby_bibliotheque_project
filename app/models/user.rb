class User < ApplicationRecord
    has_secure_password
    has_many :borrows
    has_many :books, through: :borrows
  end