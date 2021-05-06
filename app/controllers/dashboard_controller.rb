class DashboardController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def new
  end

  def addTelemedic
    Rails.logger.info("addTelemedic")
    doctors_name = params["doctors-name"]
    contact_no = params["contact-no"]
    timings = params["timing"] 
    verification_status = params["verification-status"]
    functional_status = params["functional-status"]
    location = params["location"]

    new_telemedics_record = Telemedic.create(name: doctors_name, contact: contact_no, timings: timings, verified: verification_status, functional: functional_status, location: location)
    new_telemedics_record.save
    Rails.logger.info("doctors_name")
  end
end
