class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :name
		t.text :bio
    end
  end
end
