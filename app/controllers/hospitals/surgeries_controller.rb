class Hospitals::SurgeriesController < ApplicationController
  def index
    @surgeries = Hospital.find(params[:hospital_id]).surgeries
  end
end