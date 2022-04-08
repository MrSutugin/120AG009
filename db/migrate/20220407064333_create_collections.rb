class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.integer  :collection_type, default: 0
      t.integer  :position,        default: 0
      t.integer  :status,          default: 0
      t.boolean  :active,          default: true
      t.boolean  :private,         default: false
      t.string   :name,            null: false
      t.text     :description
      t.string   :slug
      t.string   :collection_uid,  null: false, index: { unique: true }
      t.string   :ancestry

      t.timestamps
    end
    add_index :collections, :name
    add_index :collections, :ancestry
  end
end
