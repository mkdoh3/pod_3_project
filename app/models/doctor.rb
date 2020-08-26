class Doctor < ApplicationRecord
    has_secure_password
    has_many :appoinments 
    has_many :patients, through: :appointments
end
