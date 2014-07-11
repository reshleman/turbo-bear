class ShortUrl < ActiveRecord::Base
  validates :url, presence: true
  before_save :prepend_http

  def shorten
    ENV['BASE_URL'] + ENV['PORT'] + ENV['REDIRECT_PATH'] + "/" + encode_slug
  end

  def self.find_url(slug)
    id = decode_slug(slug)
    short_url = find(id)
    short_url.url
  end

  private

  def self.decode_slug(slug)
    slug.to_i(36)
  end

  def encode_slug
    id.to_s(36)
  end

  def prepend_http
    self.url = "http://#{self.url}" unless url_begins_with_http?
  end

  def url_begins_with_http?
    url.index("http") == 0
  end
end
