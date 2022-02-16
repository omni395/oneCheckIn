class Paragraph < ApplicationRecord
  belongs_to :article
  has_one_attached :pragraph_image
  has_rich_text :content
end
