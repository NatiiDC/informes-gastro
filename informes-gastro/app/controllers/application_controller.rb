class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_doctor

  def authenticate
  	redirect_to :login unless doctor_signed_in?
  end

  def current_doctor
  	@current_doctor ||= Doctor.find(session[:doctor_id]) if session[:doctor_id]
  end

  def doctor_signed_in?
  	# converts current_doctor to a boolean by negating the negation
  	!!current_doctor
  end

end
