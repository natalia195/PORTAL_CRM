class Conversation < ApplicationRecord
  belongs_to :prospect

  validates :message, presence: true
end
