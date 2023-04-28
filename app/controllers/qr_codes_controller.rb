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
    @qr_code_svg = generate_qr_code(@qr_code_info)
  end
  
  def create
    @qr_code_info = QrCodeInfo.new(qr_code_info_params)
    @qr_code_info.save

    qr_code_url = qr_code_url(@qr_code_info)
    qr_data = {
      id: @qr_code_info.id,
      first_name: qr_code_info_params[:first_name],
      last_name: qr_code_info_params[:last_name],
      city: qr_code_info_params[:city],
      address: qr_code_info_params[:address],
      zip: qr_code_info_params[:zip],
      state: qr_code_info_params[:state],
      job_place: qr_code_info_params[:job_place],
      job_description: qr_code_info_params[:job_description],
      github_link: qr_code_info_params[:github_link],
      personal_website_link: qr_code_info_params[:personal_website_link],
      qr_code_url: qr_code_url
    }.to_json

    @qr_code_svg = generate_qr_code(@qr_code_info)
    send_data @qr_code_svg.to_s, type: 'image/svg+xml', disposition: 'inline'
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

