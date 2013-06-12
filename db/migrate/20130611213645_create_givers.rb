class CreateGivers < ActiveRecord::Migration
  def change
    create_table :givers do |t|

      t.timestamps
    end
  end
end
