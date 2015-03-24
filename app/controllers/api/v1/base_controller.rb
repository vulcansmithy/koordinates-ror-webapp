class Api::V1::BaseController < ApplicationController
  
  # == Constants ==============================================================
  MISSING_USER_ID_PARAMETER = "Missing 'user_id' parameter. Said parameter is required."
  
  # == Callbacks ==============================================================
  skip_before_action :verify_authenticity_token
  
  # == Instance methods =======================================================
  def success_response(data, status_code=:ok)
    render json: data, status: status_code
  end
  
  def error_response(message, status_code)    
    render json: { :message => message }, :status => status_code
  end
  
  def user_parameter_required
    if params[:user_id].nil?
      error_response(MISSING_USER_ID_PARAMETER, :forbidden)
    else
      @user = User.where(:id => params[:user_id]).first
    end    
  end
  
  def params_to_attributes(source, recognized_attributes)
    attributes = {}
    source.each do |key, value|
      attributes.store(key.to_sym, value) if recognized_attributes.include?(key.to_sym) == true
    end
    
    return attributes
  end

end
