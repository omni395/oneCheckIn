class Article < ApplicationRecord
  self.primary_key = 'id'

  enum category: [:wiki, :rules, :blog, :draft]
  after_initialize :set_default_category, :if => :new_record?

  def set_default_category
    self.category ||= :draft
  end

  belongs_to :user
  has_rich_text :content
  has_one_attached :article_image
end
