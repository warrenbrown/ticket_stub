class Ticket < ActiveRecord::Base
  validates :name, presence: true
end
