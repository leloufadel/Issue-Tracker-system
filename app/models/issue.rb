class Issue < ApplicationRecord
  belongs_to :user
  has_many :attachments
  has_one_attached :file
  # validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

end
