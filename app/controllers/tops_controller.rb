class TopsController < ApplicationController
  before_action :validate_parameters, only: [:index]


  def index
    @tops = Top.limit(tops_parameters[:limit]).order(rate: :desc)
    json_response @tops
  end

  private

  def validate_parameters
    json_invalid_parameter unless params.has_key? :limit
  end

  def tops_parameters
    params.permit(:limit)
  end
end
