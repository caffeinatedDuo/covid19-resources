class DashboardController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def new
  end

  def addTelemedic
    Rails.logger.info("addTelemedic")
    doctors_name = params["doctors-name"]
    Rails.logger.info(doctors_name)
    new_telemedics_record = Telemedic.create(name: doctors_name)
    new_telemedics_record.save
    Rails.logger.info("doctors_name")
  end
end
