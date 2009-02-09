class VideosController < ApplicationController
  before_filter :permission, :except => [:index,:show,:show_first]
  # GET /videos
  # GET /videos.xml
  def index
    @videos = Video.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.xml
  def show
    @videos = Video.find(:all, :order => :position)
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video }
    end
  end
  
  def show_first
    @videos = Video.find(:all, :order => :position)
    @video = Video.find(:first)

    respond_to do |format|
      format.html { render :template => 'videos/show' }# show.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.xml
  def new
    @video = Video.new
    @video_file = VideoFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.xml
  def create
    @video = Video.new(params[:video])
    
    if params[:video_file][:uploaded_data].size > 0
      @video_file = VideoFile.new(params[:video_file])
      if @video_file.save
        @video_file.convert
        @video.video_file = @video_file
      end
    end if params[:video_file]

    respond_to do |format|
      if @video.save
        flash[:notice] = 'Video was successfully created.'
        format.html { redirect_to(@video) }
        format.xml  { render :xml => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.xml
  def update
    @video = Video.find(params[:id])
    
    if params[:video_file][:uploaded_data].size > 0
      @video.video_file.destroy if @video.video_file
      @video_file = @video.build_video_file(params[:video_file])
      @video_file.convert if @video_file.save
    end if params[:video_file]

    respond_to do |format|
      if @video.update_attributes(params[:video])
        flash[:notice] = 'Video was successfully updated.'
        format.html { redirect_to(@video) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.xml
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
      format.xml  { head :ok }
    end
  end
  
  def order
     params[:videomenu].each_with_index do |id, position|
       Video.update(id, {:position => position+1})
     end
     render :text => params.inspect
   end

   def inspect_params
    render :text => params.inspect
   end
end
