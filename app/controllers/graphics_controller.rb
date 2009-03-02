class GraphicsController < ApplicationController
  before_filter :permission
  # GET /graphics
  # GET /graphics.xml
  def index
    @graphics = Graphic.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @graphics }
    end
  end

  # GET /graphics/1
  # GET /graphics/1.xml
  def show
    @graphic = Graphic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @graphic }
    end
  end

  # GET /graphics/new
  # GET /graphics/new.xml
  def new
    @page = Page.find(params[:page_id])
    @site_section = @page.site_section
    @graphic = Graphic.new
    @page_section = PageSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @graphic }
    end
  end

  # GET /graphics/1/edit
  def edit
    @page = Page.find(params[:page_id])
    @site_section = @page.site_section
    @graphic = Graphic.find(params[:id])
  end

  # POST /graphics
  # POST /graphics.xml
  def create
    @graphic = Graphic.new(params[:graphic])
    @page_section = PageSection.new(params[:page_section])
    @page_section.content = @graphic
    @page_section.save
    @page = @page_section.page
    @site_section = @page.site_section

    respond_to do |format|
      if @graphic.save
        flash[:notice] = 'Graphic was successfully created.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.xml  { render :xml => @graphic, :status => :created, :location => @graphic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @graphic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /graphics/1
  # PUT /graphics/1.xml$thumb_width
  def update
    @graphic = Graphic.find(params[:id])

    respond_to do |format|
      if @graphic.update_attributes(params[:graphic]) and @page_section.update_attributes(params[:page_section])
        flash[:notice] = 'Graphic was successfully updated.'
        format.html { redirect_to(@graphic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @graphic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /graphics/1
  # DELETE /graphics/1.xml
  def destroy
    @graphic = Graphic.find(params[:id])
    @page_section = PageSection.find(params[:page_section_id])
    @page = @page_section.page
    @site_section = @page.site_section
    @graphic.destroy
    @page_section.destroy

    respond_to do |format|
      format.html { redirect_to site_section_page_url(@site_section, @page) }
      format.xml  { head :ok }
    end
  end
end
