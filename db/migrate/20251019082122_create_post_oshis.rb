class CreatePostOshis < ActiveRecord::Migration[6.1]
  def change
    create_table :post_oshis do |t|
      t.references :post, null: false, foreign_key: true
      t.references :oshi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
