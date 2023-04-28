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
    qr_data = {
      id: @qr_code_info.id,
      first_name: @qr_code_info.first_name,
      last_name: @qr_code_info.last_name,
      city: @qr_code_info.city,
      address: @qr_code_info.address,
      zip: @qr_code_info.zip,
      state: @qr_code_info.state,
      job_place: @qr_code_info.job_place,
      job_description: @qr_code_info.job_description,
      github_link: @qr_code_info.github_link,
      personal_website_link: @qr_code_info.personal_website_link
    }.to_json
    @qr_code = RQRCode::QRCode.new(qr_data)
    respond_to do |format|
      format.html
      format.svg {
        qr_code_svg = @qr_code.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 6)
        send_data qr_code_svg, type: 'image/svg+xml', disposition: 'inline'
      }
    end
  end
  
  
  
  def create
    @qr_code_info = QrCodeInfo.new(qr_code_info_params)
    if @qr_code_info.save
      redirect_to qr_code_path(@qr_code_info)
    else
      render :new
    end
  end
  
  

  private

  def generate_qr_code(qr_code_info)
    qr_data = {
      id: qr_code_info.id,
      first_name: qr_code_info.first_name,
      last_name: qr_code_info.last_name,
      city: qr_code_info.city,
      address: qr_code_info.address,
      zip: qr_code_info.zip,
      state: qr_code_info.state,
      job_place: qr_code_info.job_place,
      job_description: qr_code_info.job_description,
      github_link: qr_code_info.github_link,
      personal_website_link: qr_code_info.personal_website_link
    }.to_json

    RQRCode::QRCode.new(qr_data).as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 6)
  end

  def qr_code_info_params
    params.require(:qr_code_info).permit(:first_name, :last_name, :city, :address, :zip, :state, :job_place, :job_description, :wifi_ssid, :wifi_password, :info_type, :github_link, :personal_website_link)
  end
  
end
