class ChronologiesController < ApplicationController
  before_filter :permission
  # GET /chronologies
  # GET /chronologies.xml
  def index
    @chronologies = Chronology.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chronologies }
    end
  end

  # GET /chronologies/1
  # GET /chronologies/1.xml
  def show
    @chronology = Chronology.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chronology }
    end
  end

  # GET /chronologies/new
  # GET /chronologies/new.xml
  def new
    @page = Page.find(params[:page_id])
    @site_section = @page.site_section
    @chronology = Chronology.new
    @page_section = PageSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chronology }
    end
  end

  # GET /chronologies/1/edit
  def edit
    @page_section = PageSection.find(params[:page_section_id])
    @page = @page_section.page
    @site_section = @page.site_section
    @chronology = Chronology.find(params[:id])
  end

  # POST /chronologies
  # POST /chronologies.xml
  def create
    @chronology = Chronology.new(params[:chronology])
    @page_section = PageSection.new(params[:page_section])
    @page_section.content = @chronology
    @page = @page_section.page
    @site_section = @page.site_section

    respond_to do |format|
      if @page_section.save and @chronology.save
        flash[:notice] = 'Chronology was successfully created.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.xml  { render :xml => @chronology, :status => :created, :location => @chronology }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chronology.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chronologies/1
  # PUT /chronologies/1.xml
  def update
    @page_section = PageSection.find(params[:page_section][:id])
    @page = @page_section.page
    @site_section = @page.site_section
    @chronology = Chronology.find(params[:id])

    respond_to do |format|
      if @chronology.update_attributes(params[:chronology]) and @page_section.update_attributes(params[:page_section])
        flash[:notice] = 'Chronology was successfully updated.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chronology.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chronologies/1
  # DELETE /chronologies/1.xml
  def destroy
    @chronology = Chronology.find(params[:id])
    @page_section = PageSection.find(params[:page_section_id])
    @page = @page_section.page
    @site_section = @page.site_section
    @chronology.destroy
    @page_section.destroy

    respond_to do |format|
      format.html { redirect_to site_section_page_url(@site_section, @page) }
      format.xml  { head :ok }
    end
  end
end
