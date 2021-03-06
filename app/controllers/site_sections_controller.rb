class SiteSectionsController < ApplicationController
  before_filter :permission, :except => [:show,:show_home]
  # GET /site_sections
  # GET /site_sections.xml
  def index
    @site_sections = SiteSection.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site_sections }
    end
  end

  # GET /site_sections/1
  # GET /site_sections/1.xml
  def show
    @site_section = SiteSection.find(params[:id])
    unless @site_section.pages.empty?
      @page = @site_section.pages.first
    else
      @page = false
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site_section }
    end
  end
  
  def show_home
    if params[:id]
      @site_section = SiteSection.find(params[:id])
    else
      @site_section = SiteSection.find(:first)
    end
    
    @page = @site_section.pages.first

    respond_to do |format|
      format.html { render :template => 'site_sections/show' }# show.html.erb
      format.xml  { render :xml => @site_section }
    end
  end

  # GET /site_sections/new
  # GET /site_sections/new.xml
  def new
    @site_section = SiteSection.new
    session[:back_url] = request.referer || root_url

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site_section }
    end
  end

  # GET /site_sections/1/edit
  def edit
    @site_section = SiteSection.find(params[:id])
    session[:back_url] = request.referer || site_section_url(@site_section)
  end

  # POST /site_sections
  # POST /site_sections.xml
  def create
    @site_section = SiteSection.new(params[:site_section])

    respond_to do |format|
      if @site_section.save
        flash[:notice] = 'SiteSection was successfully created.'
        format.html { redirect_to(@site_section) }
        format.xml  { render :xml => @site_section, :status => :created, :location => @site_section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /site_sections/1
  # PUT /site_sections/1.xml
  def update
    @site_section = SiteSection.find(params[:id])

    respond_to do |format|
      if @site_section.update_attributes(params[:site_section])
        flash[:notice] = 'SiteSection was successfully updated.'
        format.html { redirect_to(@site_section) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /site_sections/1
  # DELETE /site_sections/1.xml
  def destroy
    @site_section = SiteSection.find(params[:id])
    @site_section.destroy

    respond_to do |format|
      format.html { redirect_to url_for( :controller => 'site_sections', :action => 'show_home') }
      format.js { render :template => 'site_sections/ajax_response'}
      format.xml  { head :ok }
    end
  end
  
  def order
     params[:mainmenu].each_with_index do |id, position|
       SiteSection.update(id, {:position => position+1})
     end
     render :text => params.inspect
   end

   def inspect_params
    render :text => params.inspect
   end
   
   def get_menu
     @site_sections = SiteSection.find(:all, :order => :position)
     
     respond_to do |format|
       format.html { render :partial => 'common/main_menu' }# index.html.erb
       format.xml  { render :xml => @site_sections }
     end
    end
end
