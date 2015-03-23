class Api::V1::UserController < Api::V1::BaseController

  # == Callbacks ==============================================================
  before_filter :user_parameter_required
  
  # == Instance methods =======================================================
  def waypoints
    unless @user.nil?
      json_data = ActiveModel::ArraySerializer.new(@user.waypoints, each_serializer: WaypointSerializer).to_json
      success_response(json_data)
    else
      error_response("Passed 'id' parameter is not associated with any existing user.", :not_found)  
    end
  end
  
  def add_waypoints
    unless @user.nil?
      if params[:waypoint].nil?
        error_response("Error encountered. No waypoint data was posted.", :bad_request)
      
      elsif params[:waypoint][:latitude].nil?
        error_response("'lat' parameter not found. Said parameter is a required parameter.", :bad_request)
      
      elsif params[:waypoint][:longitude].nil?
        error_response("'long' parameter not found. Said parameter is a required parameter.", :bad_request)  
            
      else  
        @user.waypoints << Waypoint.new(params_to_attributes(params[:waypoint], Waypoint.recognized_attributes))

        json_data = WaypointSerializer.new(@user.waypoints.last).as_json 
        success_response(json_data, :created)
      end
    else
      error_response("User not found.", :not_found)  
    end      
  end
  
end
