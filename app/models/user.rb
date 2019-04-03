class User < ApplicationRecord
  has_many :orders

  validates :email, format: { with: URI:: MailTo::EMAIL_REGEXP, :message => 'Su email esta mal ingresado'}
  validates :phonenumber, numericality: {minimum: 9, :message => 'Your phone number has less than 9 numbers'}
  validates :phonenumber, numericality: {maximum: 12, :message => 'Your phone number has more than 12 numbers'}
  validates :password, length: {minimum: 8, :message => 'Your password has less than 8 characters'}
  validates :password, length: {maximum: 12, :messages => 'Your password has more than 12 characters'}



end
