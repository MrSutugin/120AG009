class SntNewsController < ApplicationController
  before_action :set_snt_news, only: %i[ show edit update destroy ]

  # GET /snt_news or /snt_news.json
  def index
    @snt_news = SntNews.all
  end

  # GET /snt_news/1 or /snt_news/1.json
  def show
  end

  # GET /snt_news/new
  def new
    @snt_news = current_user.snt_news.new
    @snt = current_user.snts.all
  end

  # GET /snt_news/1/edit
  def edit
  end

  # POST /snt_news or /snt_news.json
  def create
    @snt_news = current_user.snt_news.new(snt_news_params)

    respond_to do |format|
      if @snt_news.save
        format.html { redirect_to account_news_path, notice: "Snt news was successfully created." }
        format.json { render :show, status: :created, location: @snt_news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @snt_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snt_news/1 or /snt_news/1.json
  def update
    respond_to do |format|
      if @snt_news.update(snt_news_params)
        format.html { redirect_to account_news_path, notice: "Snt news was successfully updated." }
        format.json { render :show, status: :ok, location: @snt_news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @snt_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snt_news/1 or /snt_news/1.json
  def destroy
    @snt_news.destroy

    respond_to do |format|
      format.html { redirect_to snt_news_index_url, notice: "Snt news was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snt_news
      @snt_news = SntNews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def snt_news_params
      params.require(:snt_news).permit(:name, :description, :snt_id, :user_id)
    end
end
