class ApplicationsPetsController < ApplicationController
  def index
    pet = Pet.find(params[:id])
    @applications = pet.applications

    if @applications.empty?
      flash[:notice] = "No applications exist for this pet"
    end
  end

  def update
    pet = Pet.find(params[:pet_id])
    application_pet = ApplicationsPet.get_applications_pet(params[:id], params[:pet_id])
    if application_pet.status == "Pending"
      application_pet.update(status: "Submitted")
      pet.update_status
      redirect_to "/applications/#{params[:id]}"
    else
      pet.update_status
      application_pet.update(status: "Pending")
      redirect_to "/pets/#{params[:pet_id]}"
    end
  end
end
