class Api::V1::UserController < Api::V1::BaseController
  
  # == Constants ==============================================================
  USER_DOES_NOT_EXIST         = "Passed 'id' parameter is not associated with any existing user."
  MISSING_LATITUDE_PARAMETER  = "Error encountered. Missing 'latitude' parameter. 'latitude' is a required parameter."
  MISSING_LONGITUDE_PARAMETER = "Error encountered. Missing 'longitude' parameter. 'longitude'is a required parameter."

  # == Callbacks ==============================================================
  before_filter :user_parameter_required
  
  # == Instance methods =======================================================
  
  # GET  /api/user/:user_id/waypoints
  # GET  /api/user/:user_id/waypoints, {}, { "Accept" => "application/vnd.koordinates.vulcansmithy.com; version=1" }
  # GET  /api/user/:user_id/waypoints?version=1
  # GET  /api/v1/user/:user_id/waypoints
  def waypoints
    unless @user.nil?
      success_response(ActiveModel::ArraySerializer.new(@user.waypoints, each_serializer: WaypointSerializer).to_json)
    else
      error_response(USER_DOES_NOT_EXIST, :not_found)  
    end
  end
  
  # POST /api/user/:user_id/waypoints
  # POST /api/user/:user_id/waypoints, {}, { "Accept" => "application/vnd.koordinates.vulcansmithy.com; version=1" }
  # POST /api/user/:user_id/waypoints?version=1
  # POST /api/v1/user/:user_id/waypoints
  def add_waypoints
    latitude  = params[:latitude ]
    longitude = params[:longitude]
    notes     = params[:notes    ]
    
    if @user.nil?
      error_response("User not found.", :not_found)  

    elsif latitude.nil?
      error_response(MISSING_LATITUDE_PARAMETER, :bad_request) 

    elsif longitude.nil? 
      error_response(MISSING_LONGITUDE_PARAMETER, :bad_request)  

    else
      waypoint = Waypoint.new(params_to_attributes({ latitude: latitude, longitude: longitude, notes: notes }, Waypoint.recognized_attributes))
      @user.waypoints << waypoint

      success_response(WaypointSerializer.new(waypoint).as_json, :created)
    end  
  end
  
end
