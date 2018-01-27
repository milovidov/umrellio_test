class RatesController < ApplicationController
  before_action :validate_parameters, only: [:update]

  def update
    rate = rate_parameters[:rate].to_f

    Rate.where(post_id: @id).update_all("count = count + 1, rate = (rate + #{rate})/(count + 1)")

    @rate = Rate.find(@id)
    json_response @rate, :created
  end

  private

  def rate_parameters
    params.permit(:rate)
  end

  def validate_parameters
    @id = params[:id]
    if params[:rate].nil? or params[:rate].to_f < 1.0 or params[:rate].to_f > 5.0 then
      json_invalid_parameter nil
    end
  end

end
