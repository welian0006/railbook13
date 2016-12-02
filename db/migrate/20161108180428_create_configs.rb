class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|

      t.timestamps
    end
  end
end
