class ShortUrlsController < ApplicationController
  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.create(short_url_params)

    if @short_url.save
      redirect_to @short_url
    else
      render :new
    end
  end

  def show
    short_url = ShortUrl.find(params[:id])
    @redirect_url = short_url.shorten
  end

  private

  def short_url_params
    params.
      require(:short_url).
      permit(:url)
  end
end
