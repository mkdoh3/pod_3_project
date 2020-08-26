# frozen_string_literal: true

class Patient < ApplicationRecord
    validates :name, :phone_number, :age, :address, presence: true
    validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/}
end
