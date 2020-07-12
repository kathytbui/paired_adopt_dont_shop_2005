class ApplicationsPetsController < ApplicationController
  def index
    pet = Pet.find(params[:id])
    @applications = pet.applications

    if @applications.empty?
      flash[:notice] = "No applications exist for this pet"
    end
  end
end
