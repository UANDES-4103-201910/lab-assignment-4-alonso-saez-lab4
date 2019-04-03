class User < ApplicationRecord
  has_many :orders

  validates :email, format: { with: URI:: MailTo::EMAIL_REGEXP}, message: 'Su email esta mal ingresado'
  validates :phonenumber, length: {minimum: 9}, message: 'Your phone number has less than 9 numbers'
  validates :phonenumber, length: {maximum: 12}, message: 'Your phone number has more than 12 numbers'
  validates :password, length: {minimum: 8}, message: 'Your password has less than 8 characters'
  validates :password, length: {maximum: 12}, message: 'Your password has more than 12 characters'

end
