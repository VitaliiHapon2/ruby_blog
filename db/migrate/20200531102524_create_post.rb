class CreatePost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :text
      t.has_many :comments
      t.belongs_to :user_id, null: false, foreign_key: true
      t.belongs_to :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
