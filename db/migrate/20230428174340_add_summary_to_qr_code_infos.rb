class AddSummaryToQrCodeInfos < ActiveRecord::Migration[6.0]
  def change
    add_column :qr_code_infos, :summary, :string
  end
end
