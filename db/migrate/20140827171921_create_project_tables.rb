class CreateProjectTables < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
    	t.column :name, :string
    end

    create_table :divisions do |t|
    	t.column :name, :string
    	t.belongs_to :league
    end

    create_table :teams do |t|
    	t.column :name, :string
    	t.belongs_to :division
    	t.belongs_to :game
    end

    create_table :players do |t|
    	t.column :name, :string
    	t.belongs_to :team
    end

    create_table :games do |t|
    	t.datetime
    end
  end
end
