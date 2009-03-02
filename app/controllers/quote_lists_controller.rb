class QuoteListsController < ApplicationController
  before_filter :permission
  # GET /quote_lists
  # GET /quote_lists.xml
  def index
    @quote_lists = QuoteList.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quote_lists }
    end
  end

  # GET /quote_lists/1
  # GET /quote_lists/1.xml
  def show
    @quote_list = QuoteList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote_list }
    end
  end

  # GET /quote_lists/new
  # GET /quote_lists/new.xml
  def new
    @page = Page.find(params[:page_id])
    @site_section = @page.site_section
    @quote_list = QuoteList.new
    @page_section = PageSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quote_list }
    end
  end

  # GET /quote_lists/1/edit
  def edit
    @page_section = PageSection.find(params[:page_section_id])
    @page = @page_section.page
    @site_section = @page.site_section
    @quote_list = QuoteList.find(params[:id])
  end

  # POST /quote_lists
  # POST /quote_lists.xml
  def create
    @quote_list = QuoteList.new(params[:quote_list])
    @page_section = PageSection.new(params[:page_section])
    @page_section.content = @quote_list
    @page_section.save
    @page = @page_section.page
    @site_section = @page.site_section

    respond_to do |format|
      if @quote_list.save
        flash[:notice] = 'QuoteList was successfully created.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.xml  { render :xml => @quote_list, :status => :created, :location => @quote_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quote_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quote_lists/1
  # PUT /quote_lists/1.xml
  def update
    @quote_list = QuoteList.find(params[:id])
    @page_section = PageSection.find(params[:page_section][:id])
    @page = @page_section.page
    @site_section = @page.site_section

    respond_to do |format|
      if @quote_list.update_attributes(params[:quote_list]) and @page_section.update_attributes(params[:page_section])
        flash[:notice] = 'QuoteList was successfully updated.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quote_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_lists/1
  # DELETE /quote_lists/1.xml
  def destroy
    @quote_list = QuoteList.find(params[:id])
    @page_section = PageSection.find(params[:page_section_id])
    @page = @page_section.page
    @site_section = @page.site_section
    @quote_list.destroy
    @page_section.destroy

    respond_to do |format|
      format.html { redirect_to site_section_page_url(@site_section, @page) }
      format.xml  { head :ok }
    end
  end
end
