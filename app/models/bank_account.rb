class BankAccount < ApplicationRecord
  validates :account_number, uniqueness: true, presence: true
  validates_numericality_of :balance, greater_than: 0
end