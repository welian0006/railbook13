class CreateTennis < ActiveRecord::Migration
  def change
    create_table :tennis do |t|
      t.string :name
      t.date :published

      t.timestamps
    end
  end
end
