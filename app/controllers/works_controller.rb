class WorksController < ApplicationController
  before_filter :permission, :except => [:index, :show]
  # GET /works
  # GET /works.xml
  def index
    @works = Work.find_all_by_is_early(false, :order => :position)
    @earlier_works = Work.find_all_by_is_early(true, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @works }
    end
  end

  # GET /works/1
  # GET /works/1.xml
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /works/new
  # GET /works/new.xml
  def new
    @work = Work.new
    @work_thumbnail = WorkThumbnail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work }
    end
  end

  # GET /works/1/edit
  def edit
    @work = Work.find(params[:id])
    @photo = @work.photos.build
  end

  # POST /works
  # POST /works.xml
  def create
    @work = Work.new(params[:work])
    if params[:work_thumbnail][:uploaded_data].size > 0
      @work.create_work_thumbnail(params[:work_thumbnail])
    end if params[:work_thumbnail]
    if params[:photo][:uploaded_data].size > 0
      @work.create_photo(params[:photo])
    end if params[:photo]

    respond_to do |format|
      if @work.save
        flash[:notice] = 'Work was successfully created.'
        format.html { redirect_to(@work) }
        format.xml  { render :xml => @work, :status => :created, :location => @work }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.xml
  def update
    @work = Work.find(params[:id])
    if params[:work_thumbnail][:uploaded_data].size > 0
      @work.work_thumbnail.destroy if @work.work_thumbnail
      @work.create_work_thumbnail(params[:work_thumbnail])
    end if params[:work_thumbnail]
    
    if params[:photo][:uploaded_data].size > 0
      @photo = Photo.create(params[:photo])
      @work.photos << @photo
    end if params[:photo]

    respond_to do |format|
      if @work.update_attributes(params[:work])
        flash[:notice] = 'Work was successfully updated.'
        format.html { redirect_to(@work) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @work = Work.find(params[:id])
    @work.work_thumbnail.destroy
    @work.destroy

    respond_to do |format|
      format.html { redirect_to(works_url) }
      format.xml  { head :ok }
    end
  end
  
  def order
    container = params[:container_id]
    params[container.to_sym].each_with_index do |id, position|
      Work.update(id, {:position => position+1})
    end
    render :text => params.inspect
  end

  def inspect_params
    render :text => params.inspect
  end
end
