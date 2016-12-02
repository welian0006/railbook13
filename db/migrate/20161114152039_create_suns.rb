class CreateSuns < ActiveRecord::Migration
  def change
    create_table :suns do |t|
      t.string :name

      t.timestamps
    end
  end
end
