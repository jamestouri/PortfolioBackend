class Investment < ApplicationRecord
  validates :company, :quantity, :cost, :date_of_trade, :date_created, presence: true 


end
