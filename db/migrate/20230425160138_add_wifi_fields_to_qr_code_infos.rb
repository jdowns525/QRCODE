class AddWifiFieldsToQrCodeInfos < ActiveRecord::Migration[6.0]
  def change
    add_column :qr_code_infos, :wifi_ssid, :string
    add_column :qr_code_infos, :wifi_password, :string
  end
end
