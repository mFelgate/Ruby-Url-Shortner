class UrlsController < ApplicationController
  before_action :set_url, only: %i[ show update destroy ]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  def shortUrl
    if Url.exists? shortUrl: params[:shortUrl]
      @url = Url.find_by(shortUrl: params[:shortUrl])
      render :show, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end
  # POST /urls
  # POST /urls.json
  def create

    if Url.exists? longUrl: params[:longUrl]
      @url = Url.find_by(longUrl: params[:longUrl])
      render :show, status: :created, location: @url
    else 
      @url = Url.new(url_params)
      if @url.save
          render :show, status: :created, location: @url
      else
          render json: @url.errors, status: :unprocessable_entity
      end
    end
  end
  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    if @url.update(url_params)
      render :show, status: :ok, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
  end

  private

    # def shorten (num)
    #   alphabet_array = [*'a'..'z', *'0'..'9']
    #   short_url = ""
    #   while num >0
        
    #     index = num % 36
    #     short_url = short_url + alphabet_array[index]
    #     num = num/36
    #   end 
    #   puts short_url
    # end
    #Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.permit(:shortUrl, :longUrl)
    end
end
