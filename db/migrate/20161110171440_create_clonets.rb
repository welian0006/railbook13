class CreateClonets < ActiveRecord::Migration
  def change
    create_table :clonets do |t|
      t.string :name

      t.timestamps
    end
  end
end
