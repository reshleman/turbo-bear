class ShortUrlsController < ApplicationController
  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.create(short_url_params)
    @short_url.slug = @short_url.encode_slug

    if @short_url.save
      redirect_to @short_url
    else
      render :new
    end
  end

  def show
    short_url = ShortUrl.find(params[:id])
    @redirect_url = create_redirect_url(short_url)
  end

  private

  def short_url_params
    params.
      require(:short_url).
      permit(:url)
  end

  def create_redirect_url(short_url)
    protocol = request.protocol
    hostname = request.host
    port = ":#{request.port}" unless request.port == 80

    "#{protocol}#{hostname}#{port}/go/#{short_url.slug}"
  end
end
