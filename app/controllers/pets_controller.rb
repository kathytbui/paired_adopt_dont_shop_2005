class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    new_pet = shelter.pets.create(pet_params)
    if new_pet.valid?
      redirect_to("/shelters/#{shelter.id}/pets")
    else
      flash[:notices] = new_pet.errors.full_messages
      redirect_to("/shelters/#{shelter.id}/pets/new")
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    if pet.valid?
      redirect_to "/pets/#{pet.id}"
    else
      flash[:notices] = pet.errors.full_messages
      redirect_to("/pets/#{pet.id}/edit")
    end
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private
  def pet_params
    params.permit(:image, :name, :approx_age, :sex, :description, :adoption_status, :shelter_id)
  end
end
