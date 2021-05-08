class DashboardController < ApplicationController
  before_action :logged_in_user

  def new
  end

  # Telemedic Controllers
  def addTelemedic
  end

  def createTelemedic
    Rails.logger.info("addTelemedic")
    doctors_name = params["doctors-name"]
    contact_no = params["contact-no"]
    timings = params["timing"]
    verification_status = params["verification-status"]
    functional_status = params["functional-status"]
    location = params["location"]

    new_telemedics_record = Telemedic.create(name: doctors_name, contact: contact_no, timings: timings, verified: verification_status, functional: functional_status, location: location)
    new_telemedics_record.save

    # TO-DO: handle non-200 cases
    render json: {message: "OK"}
    Rails.logger.info("doctors_name")
  end

  def updateTelemedic
    queryParameters = request.query_parameters
    toUpdateTelemedicID = params['id'];
    toUpdateTelemedicID = toUpdateTelemedicID.to_i
    doctors_name = params["doctors-name"]
    contact_no = params["contact-no"]
    timings = params["timing"]
    verification_status = params["verification-status"]
    functional_status = params["functional-status"]
    location = params["location"]

    update_telemedics_record = Telemedic.find(toUpdateTelemedicID)
    update_telemedics_record.name = doctors_name
    update_telemedics_record.contact = contact_no
    update_telemedics_record.timings = timings
    update_telemedics_record.verified = verification_status
    update_telemedics_record.functional = functional_status
    update_telemedics_record.location = location

    update_telemedics_record.save
  end

  def updateViewTelemedic
    Rails.logger.info(request.query_parameters)
    queryParameters = request.query_parameters
    toUpdateTelemedicID = queryParameters['id'];
    # TODO: Check that query param for id is not empty
    if Telemedic.find_by(id: toUpdateTelemedicID)
      @toEditTelemedicData = Telemedic.find_by(id: toUpdateTelemedicID)
      Rails.logger.info('Match Found!')
      Rails.logger.info(@toEditTelemedicData.id)

    else
      Rails.logger.info('Match Failed!')
    end
  end

  def viewTelemedic
    @telemedics = Telemedic.all
  end
  # End of Telemedic Controllers
end
