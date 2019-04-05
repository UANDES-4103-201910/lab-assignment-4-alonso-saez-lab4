class User < ApplicationRecord
  has_many :orders

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :phonenumber, length: {in: 9..12}, :message => 'Your phone number has less than 9 numbers'}
  validates :password, length: {minimum: 8, :message => 'Your password has less than 8 characters'}
  validates :password, length: {maximum: 12, :messages => 'Your password has more than 12 characters'}



end
