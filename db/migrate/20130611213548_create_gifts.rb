class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.integer :provider_id
      t.string :status

      t.timestamps
    end
  end
end
