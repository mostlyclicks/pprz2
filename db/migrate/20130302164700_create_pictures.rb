class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :pict_file

      t.timestamps
    end
  end
end
