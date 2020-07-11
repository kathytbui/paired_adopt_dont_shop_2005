class ApplicantPetsController < ApplicationController

  def create
    pet_ids = params[:favorite][:pet_id].reject!(&:empty?)
    
    require "pry"; binding.pry
    # applicant = Applicant.create(applicant_params)
    # if new_applicant.save
    #   flash[:notice] = "Application Submitted!"
    #   redirect_to "/applicant_pets/#{pet.id}"
    # else
    #   flash[:notice] = "Application was not submitted successfully"
    #   redirect_to "/applicants/new"
    # end
  end

  private

  def applicant_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
