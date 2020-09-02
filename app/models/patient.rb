# frozen_string_literal: true

class Patient < ApplicationRecord
    #validates :name, :phone_number, :age, :address, presence: true
    #validates :phone_number, length: {is: 10}
    has_many :appointments
    has_many :doctors, through: :appointments
    

    before_validation :make_name_case

    private

    def make_name_case
        self.name = self.name.titlecase 
    end
end
