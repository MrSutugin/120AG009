class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string   :email
      t.string   :password_digest
      t.string   :first_name
      t.string   :last_name
      t.integer  :role, default: 0
      t.string   :phone
      t.string   :remember_token
      t.datetime :remember_token_expires_at

      t.timestamps
    end
  end
end
