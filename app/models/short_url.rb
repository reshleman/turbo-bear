class ShortUrl < ActiveRecord::Base
  def self.encode_slug
    id.to_s(36)
  end

  def self.decode_slug(slug)
    slug.to_i(36)
  end

  def redirect_url
    redirect_url =
      if url.index("http") != 0
        "http://#{url}"
      else
        url
      end

    redirect_url
  end
end
