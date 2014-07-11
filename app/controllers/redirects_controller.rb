class RedirectsController < ApplicationController
  def show
    url = ShortUrl.find_url(params[:slug])

    redirect_to url
  end
end
