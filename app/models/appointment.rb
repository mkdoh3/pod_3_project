class Appointment < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient
    accepts_nested_attributes_for :patient 

    def patient_attributes=(patient_attributes)
        patient = Patient.find_or_create_by(patient_attributes)
        self.patient = patient 
        save
    end
end
