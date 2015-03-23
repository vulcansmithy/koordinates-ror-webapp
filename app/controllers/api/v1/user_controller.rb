class Api::V1::UserController < Api::V1::BaseController

  # == Callbacks ==============================================================
  before_filter :user_parameter_required
  
  # == Instance methods =======================================================
  def waypoints
    unless @user.nil?
      success_response(ActiveModel::ArraySerializer.new(@user.waypoints, each_serializer: WaypointSerializer).to_json)
    else
      error_response("Passed 'id' parameter is not associated with any existing user.", :not_found)  
    end
  end
  
  def add_waypoints
    latitude  = params[:latitude ]
    longitude = params[:longitude]
    notes     = params[:notes    ]
    
    if @user.nil?
      error_response("User not found.", :not_found)  

    elsif latitude.nil?
      error_response("Error encountered. Missing 'latitude' parameter. Said parameter is a required parameter.",  :bad_request) 

    elsif longitude.nil? 
      error_response("Error encountered. Missing 'longitude' parameter. Said parameter is a required parameter.", :bad_request)  

    else
      waypoint = Waypoint.new(params_to_attributes({ latitude: latitude, longitude: longitude, notes: notes }, Waypoint.recognized_attributes))
      @user.waypoints << waypoint

      success_response(WaypointSerializer.new(waypoint).as_json, :created)
    end  
  end
  
end
