class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments do |t|
      t.references :issue, null: false, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
