class RemoveSlugFromShortUrl < ActiveRecord::Migration
  def change
    remove_column :short_urls, :slug
  end
end
