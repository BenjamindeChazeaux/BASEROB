class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :user_agent
      t.string :path
      t.boolean :is_ai_bot

      t.timestamps
    end
  end
end
