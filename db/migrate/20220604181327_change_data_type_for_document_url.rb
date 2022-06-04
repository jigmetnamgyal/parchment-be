class ChangeDataTypeForDocumentUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :document_url
    add_column :profiles, :document_url, :string, array: true, default: []
    add_index  :profiles, :document_url, using: 'gin'
  end
end
