class IpsController < ApplicationController
  def index
    @ips = Ip.all
    json_response @ips
  end
end
