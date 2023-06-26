class PassengerMailer < ApplicationMailer
    def registration_confirmation
        @passenger = params[:passenger]
        mail(to: @passenger.name, from: "Joe Mama")
    end
end
