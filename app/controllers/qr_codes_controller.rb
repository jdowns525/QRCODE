class QrCodesController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_svg'

  def index
    @qr_codes = QrCodeInfo.all
  end
  
  def new
    @qr_code_info = QrCodeInfo.new
  end

  def show
    @qr_code_info = QrCodeInfo.find(params[:id])
  end
  

  def create
    @qr_code_info = QrCodeInfo.new(qr_code_info_params)
    @qr_code_info.save

    qr_data = qr_code_info_params.except(:info_type).to_json
    @qr_code = RQRCode::QRCode.new(qr_data)
    @qr_code_svg = @qr_code.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 6)
    send_data @qr_code_svg.to_s, type: 'image/svg+xml', disposition: 'inline'
  end

  private

  def qr_code_info_params
    params.require(:qr_code_info).permit(:first_name, :last_name, :city, :address, :zip, :state, :job_place, :job_description, :wifi_ssid, :wifi_password, :info_type, :github_link, :personal_website_link)
  end
  
end
