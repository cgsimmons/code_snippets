class AddLanguageToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_reference :snippets, :language, foreign_key: true
  end
end
