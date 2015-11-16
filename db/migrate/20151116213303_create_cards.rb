class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
		t.string	:cardnum
    	t.string	:cardtype
    	t.integer	:expire_m
    	t.integer	:expire_y
      t.timestamps null: false
    end
  end
end
