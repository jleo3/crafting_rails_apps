class CreateSqlTemplates < ActiveRecord::Migration
  def self.up
    create_table :sql_templates do |t|
      t.text :body
      t.string :path
      t.string :format
      t.string :locale
      t.string :handler
      t.boolean :partial, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sql_templates
  end
end
