class CreateSntNews < ActiveRecord::Migration[7.0]
  def change
    create_table :snt_news do |t|
      t.string :name
      t.string :description
      t.references :snt, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
