class QRCodesController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_svg'

  def new
  end

  def create
    qr_data = params.slice(:first_name, :last_name, :city, :address, :zip, :state, :job_place, :job_description).to_json
    @qr_code = RQRCode::QRCode.new(qr_data)
    @qr_code_svg = @qr_code.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 6)
    send_data @qr_code_svg.to_s, type: 'image/svg+xml', disposition: 'inline'
  end
end
