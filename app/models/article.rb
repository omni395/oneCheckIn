class Article < ApplicationRecord
  #enum category: {wiki: "Wiki", rules: "Rules", blog: "Blog", draft: "Draft"}
  enum category: [:wiki, :rules, :blog, :draft]
  after_initialize :set_default_category, :if => :new_record?

  def set_default_category
    self.category ||= :draft
  end

  belongs_to :user
  has_many :paragraphs, dependent: :destroy
  accepts_nested_attributes_for :paragraphs, allow_destroy: true, reject_if: proc { |attr| attr['content'].blank? }
  has_one_attached :article_image
end
