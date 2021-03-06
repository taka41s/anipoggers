class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]
  # GET /videos or /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1 or /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    if current_user.has_role? :admin
      @video = Video.new
    else
      redirect_to root_path
    end
  end

  # GET /videos/1/edit
  def edit
    if current_user.has_role? :admin
    else 
      redirect_to root_path
    end
  end

  # POST /videos or /videos.json
  def create
    if current_user.has_role? :admin
      @video = Video.new(video_params)
      respond_to do |format|
        if @video.save
          format.html { redirect_to video_url(@video), notice: "Video was successfully uploaded." }
        end
      end
    else 
      redirect_to root_path, notice: 'Not authorized'
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    if current_user.has_role? :admin
      respond_to do |format|
        if @video.update(video_params)
          format.html { redirect_to video_url(@video), notice: "Video was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, notice: 'Not authorized'
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    if current_user.has_role? :admin
      @video.destroy

      respond_to do |format|
        format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      end
    elsif current_user == nil
      redirect_to root_path
    elsif current_user.has_role? :newuser
      redirect_to root_path
    else
      redirect_to root_path, notice: 'Not authorized'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :description, :video)
    end
end
