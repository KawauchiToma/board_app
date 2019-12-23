class Message < ApplicationRecord
  belongs_to :account
  validates :message, presence: true
end
