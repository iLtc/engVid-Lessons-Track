class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :url
      t.boolean :completed

      t.timestamps
    end
  end
end
