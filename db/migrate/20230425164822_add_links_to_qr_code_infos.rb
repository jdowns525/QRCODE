class AddLinksToQrCodeInfos < ActiveRecord::Migration[6.0]
  def change
    add_column :qr_code_infos, :github_link, :string
    add_column :qr_code_infos, :personal_website_link, :string
  end
end
