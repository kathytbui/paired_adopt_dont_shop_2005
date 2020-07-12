class ApprovalsController < ApplicationController
  def create
    Approvals.create()


    redirect_to "/pets/#{pet_id}"
  end
end
