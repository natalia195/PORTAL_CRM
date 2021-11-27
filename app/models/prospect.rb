class Prospect < ApplicationRecord
    has_many :conversations, dependent: :destroy
    belongs_to :user

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :status, presence: true, inclusion: { in: ["Prospecto", "Muy interesado", "Cliente" ] }
    validates :phone, presence: true
    validates :email, presence: true
end
