class AddListIdColumnToItem < ActiveRecord::Migration
  
  def change
    change_table :items do |t|
      t.integer :list_id, :index => true
    end
  end
  
end
