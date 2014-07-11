class RedirectsController < ApplicationController
  def show
    id = ShortUrl.decode_slug(params[:slug])
    short_url = ShortUrl.find(id)

    redirect_to short_url.redirect_url
  end
end
