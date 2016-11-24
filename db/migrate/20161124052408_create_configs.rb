class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.string :name
      t.string :title
      t.text :value

      t.timestamps
    end
  end
end
