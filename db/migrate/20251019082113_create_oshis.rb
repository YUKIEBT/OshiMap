class CreateOshis < ActiveRecord::Migration[6.1]
  def change
    create_table :oshis do |t|
      t.string :name

      t.timestamps
    end
  end
end
