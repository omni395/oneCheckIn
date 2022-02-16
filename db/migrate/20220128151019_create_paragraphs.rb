class CreateParagraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :paragraphs do |t|
      t.belongs_to :article, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
