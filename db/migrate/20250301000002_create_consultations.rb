class CreateConsultations < ActiveRecord::Migration[7.1]
  def change
    create_table :consultations do |t|
      t.string :name
      t.string :email
      t.datetime :date
      t.text :message
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end 