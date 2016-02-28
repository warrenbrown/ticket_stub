class Ticket < ActiveRecord::Base
  validates  :name, :address, :price_paid, :email_address, :seat_id_seq, presence: true
end
