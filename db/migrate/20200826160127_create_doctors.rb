class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :user_name
      t.string :password_digest

      t.timestamps
    end
  end
end
