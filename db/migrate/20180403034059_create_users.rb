class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :number
      t.string :country
      t.string :state
      t.string :city
      t.string :nick_name
      t.timestamps
    end
  end
end
