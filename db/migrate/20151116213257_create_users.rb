class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string	:fname
    	t.string	:lname
    	t.string	:email
    	t.string	:phone
    	t.decimal	:cash_bal
      t.timestamps null: false
    end
  end
end
