class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :zip_code , null:false
      t.integer :state_id , null:false
      t.string :city , null:false
      t.string :addres1 , null:false
      t.string :addres2
      t.string :tell_num , null:false
      t.references :order ,null:false ,foreign_key: true
      t.timestamps
    end
  end
end