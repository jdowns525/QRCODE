# == Schema Information
#
# Table name: qr_code_infos
#
#  id              :integer          not null, primary key
#  address         :string
#  city            :string
#  first_name      :string
#  info_type       :string
#  job_description :string
#  job_place       :string
#  last_name       :string
#  state           :string
#  wifi_password   :string
#  wifi_ssid       :string
#  zip             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class QrCodeInfo < ApplicationRecord
end
