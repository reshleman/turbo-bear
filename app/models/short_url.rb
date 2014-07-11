class ShortUrl < ActiveRecord::Base
  def encode_slug
    id.to_s(36)
  end

  def decode_slug
    slug.to_i(36)
  end
end
