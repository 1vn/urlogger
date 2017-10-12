class CreateUrloggerVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :urlogger_visits do |t|
      t.string :url

      t.timestamps
    end
  end
end
