module AppointmentsHelper
    
    def current_user
        @current_user = Doctor.last
    end

end
