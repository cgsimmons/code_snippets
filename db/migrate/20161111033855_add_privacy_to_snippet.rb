class AddPrivacyToSnippet < ActiveRecord::Migration[5.0]
  def change
    add_column :snippets, :privacy, :boolean, default: false
  end
end
