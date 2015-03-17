class Api::V1::BaseController < ApplicationController
  
  # == Instance methods =======================================================
  def success_response(data, status_code=:ok)
    render json: data, status: status_code
  end
  
  def error_response(message, status_code)    
    render json: { :message => message }, :status => status_code
  end
  
  def user_parameter_required
    if params[:user_id].nil?
      error_response("Missing 'user_id' parameter. Said parameter is required.", :forbidden)
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
