class SessionsController < ApplicationController

  def create
  	@doctor = Doctor.find_or_create_from_auth_hash(request.env["omniauth.auth"])
  	session[:doctor_id] = @doctor.id
  	redirect_to :me
  end

  def destroy
  	session[:doctor_id] = nil
  	redirect_to root_path
  end

end
