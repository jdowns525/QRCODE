module QrCodesHelper
  def generate_qr_code_svg(qr_code_info)
    require 'rqrcode'
    require 'rqrcode_svg'

    qr_data = qr_code_info.attributes.except("id", "created_at", "updated_at", "info_type").to_json
    qr_code = RQRCode::QRCode.new(qr_data)
    qr_code.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 6).to_s
  end
end
