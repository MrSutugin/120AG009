class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string   :email,           null: false, index: { unique: true }
      t.string   :password_digest
      t.string   :name,            null: false, index: { unique: true }
      t.string   :first_name
      t.string   :last_name
      t.text     :description
      t.integer  :status,          default: 0
      t.boolean  :active,          default: true
      t.boolean  :private,         default: false
      t.integer  :role,            default: 0
      t.string   :slug,            null: false, index: { unique: true }
      t.string   :user_uid,        null: false, index: { unique: true }

      t.timestamps
    end
  end
end
