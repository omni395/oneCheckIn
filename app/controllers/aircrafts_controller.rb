class AircraftsController < ApplicationController
  before_action :set_aircraft, only: %i[ show ]

  def index
    @aircrafts = Aircraft.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aircraft
      @aircraft = Aircraft.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aircraft_params
      params.require(:aircraft).permit(:name, :description, :www, :iata, :icao, :checkin_link, :manage_booking, :user_id)
    end
end
