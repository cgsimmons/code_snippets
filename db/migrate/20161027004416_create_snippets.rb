class CreateSnippets < ActiveRecord::Migration[5.0]
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :code
      t.string :description

      t.timestamps
    end
  end
end
