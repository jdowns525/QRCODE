class CreateQrCodeInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :qr_code_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :address
      t.string :zip
      t.string :state
      t.string :job_place
      t.string :job_description
      t.string :wifi_ssid
      t.string :wifi_password
      t.string :info_type

      t.timestamps
    end
  end
end
