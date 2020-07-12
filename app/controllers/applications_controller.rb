class ApplicationsController < ApplicationController
  def new
    @favorites = Favorite.all
  end

  def create
    application = Applications.new(application_params)
    pet_ids = params[:favorite][:pet_id].reject!(&:empty?)
    pets = pet_ids.map {|id| Pet.find(id)}

    if application.save
      pets.each {|pet| ApplicationsPet.create(applications: application, pet: pet) }
      flash[:notice] = "Application Submitted!"
      redirect_to '/favorites'
    else
      flash[:notice] = "Application was not submitted successfully"
      redirect_to '/applications/new'
    end
  end

  def show
    @application = Applications.find(params[:id])
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
