class Api::V1::UserController < Api::V1::BaseController
  
  # == Callbacks ==============================================================
  before_filter :user_parameter_required
  
  # == Instance methods =======================================================
  def waypoints
    unless @user.nil?
      success_response({ :waypoints => @user.waypoints })
    else
      error_response("Passed user_id is not associated with any existing user.", :not_found)  
    end    
  end
  
  def add_waypoints
    unless @user.nil?
      if params[:waypoint].nil?
        error_response("Error encountered. No waypoint data was posted.", :bad_request)
      
      elsif params[:waypoint][:lat].nil?
        error_response("'lat' parameter not found. Said parameter is a required parameter.", :bad_request)
      
      elsif params[:waypoint][:long].nil?
        error_response("'long' parameter not found. Said parameter is a required parameter.", :bad_request)  
            
      else  
        new_waypoint = Waypoint.new(params_to_attributes(params[:waypoint], Waypoint.recognized_attributes))
        @user.waypoints << new_waypoint
      
        success_response({ :added_waypoint => new_waypoint }, :created)
      end
    else
      error_response("User not found.", :not_found)  
    end      
  end
  
end
