class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title,      :null => false, :default => ''
      t.text :description,  :null => false, :default => ''

      t.timestamps
    end
  end
end
