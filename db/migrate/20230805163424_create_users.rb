class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :enail
      t.string :uid

      t.timestamps
    end
  end
end
