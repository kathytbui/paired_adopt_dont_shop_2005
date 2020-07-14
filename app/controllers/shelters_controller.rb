class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def create
    shelter = Shelter.create(shelter_params)
    if shelter.save
      redirect_to '/shelters'
    else
      redirect_to '/shelters/new'
      flash[:errors] = shelter.errors.full_messages
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
    else
      redirect_to "/shelters/#{shelter.id}/edit"
      flash[:errors] = shelter.errors.full_messages
    end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  def pet_index
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
