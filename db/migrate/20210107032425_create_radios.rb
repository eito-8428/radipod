class CreateRadios < ActiveRecord::Migration[5.2]
  def change
    create_table :radios do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.string :audio
      t.string :title

      t.timestamps
    end
  end
end
