module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_responce_with_string_ip(object, status = :ok)
    hash = JSON.parse(object.to_json)
    hash['ip'] = object.ip.to_s
    json_response hash, status
  end

  def json_invalid_parameter(object = nil)
    json_response object, 422
  end

end