class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 12 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 5, maximum: 15 }
end
