class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :giver
      t.boolean :receiver

      t.timestamps
    end
  end
end
