class AddGameTable < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.column :date, :datetime
  	end
  end
end
