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
  validates :info_type, presence: true
  validates :first_name, :last_name, :city, :address, :zip, :state, :job_place, :job_description, presence: true, if: :business_card?
  validates :wifi_ssid, :wifi_password, presence: true, if: :wifi?

  def business_card?
    info_type == 'Business Card'
  end

  def wifi?
    info_type == 'Wi-Fi'
  end
end

