class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  def shortUrl
    if Url.exists? shortUrl: params[:shortUrl]
      @url = Url.find_by(shortUrl: params[:shortUrl])
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end
  # GET /urls/1
  def show
    render json: @url
  end

  def create

    if Url.exists? longUrl: params[:longUrl]
      @url = Url.find_by(longUrl: params[:longUrl])
      render json: @url
    else 
      @url = Url.new(url_params)
      if @url.save
        render json: @url
      else
          render json: @url.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:shortUrl, :longUrl)
    end
end
