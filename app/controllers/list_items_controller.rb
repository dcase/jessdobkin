class ListItemsController < ApplicationController
  before_filter :permission
  
  # GET /list_items
  # GET /list_items.xml
  def index
    @list = List.find(params[:list_id])
    @list_items = @list.list_items.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @list_items }
    end
  end

  # GET /list_items/1
  # GET /list_items/1.xml
  def show
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_item }
    end
  end

  # GET /list_items/new
  # GET /list_items/new.xml
  def new
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.build
    @page_section = @list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    
    respond_to do |format|
      format.js   { render :partial => 'ajax_new' }
      format.html # new.html.erb
      format.xml  { render :xml => @list_item }
    end
  end

  # GET /list_items/1/edit
  def edit
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.find(params[:id])
    @page_section = @list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    
  end

  # POST /list_items
  # POST /list_items.xml
  def create
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.build(params[:list_item])
    @page_section = @list.page_section

    respond_to do |format|
      if @list_item.save
        @page = @page_section.page
        @site_section = @page.site_section
        flash[:notice] = 'ListItem was successfully created.'
        format.html { redirect_to  site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { render :xml => @list_item, :status => :created, :location => @list_item }
      else
        format.js { render :update do |page|
          page.replace_html "list_item_form_container", :partial => 'ajax_new', :list_id => @list, :page_section_id => @page_section
        end
        }
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_items/1
  # PUT /list_items/1.xml
  def update
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.find(params[:id])
    @page_section = @list.page_section

    respond_to do |format|
      if @list_item.update_attributes(params[:list_item])
        @page = @page_section.page
        @site_section = @page.site_section
        flash[:notice] = 'ListItem was successfully updated.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { head :ok }
      else
        format.js { render :update do |page|
          page.replace_html "list_item_form_container", :partial => 'ajax_new', :list_id => @list, :page_section_id => @page_section
        end
        }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1
  # DELETE /list_items/1.xml
  def destroy
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.find(params[:id])
    @page_section = @list.page_section
    
    @list_item.destroy

    respond_to do |format|
      @page = @page_section.page
      @site_section = @page.site_section
      format.html { redirect_to site_section_page_url(@site_section, @page) }
      format.js { render :template => 'page_sections/ajax_success' }
      format.xml  { head :ok }
    end
  end
  
  def order
  	list = 'list_' + params[:list_id]
    params[list.to_sym].each_with_index do |id, position|
     ListItem.update(id, {:position => position+1})
    end
    render :text => params.inspect
  end
 
  def inspect_params
    render :text => params.inspect
  end
end
