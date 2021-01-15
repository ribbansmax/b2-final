class OperationsController < ApplicationController
  def create
    Operation.create!(operations_params)
    redirect_to surgery_path(params["operation"]["surgery_id"])
  end

  private

  def operations_params
    paramaters = params.require("operation").permit("surgery_id", "name")
    parameters = {surgery_id: paramaters["surgery_id"], doctor_id: doctor.id}
  end

  def doctor
    Doctor.find_by(name: params["operation"]["name"])
  end
end