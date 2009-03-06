class ChronologyItemsController < ApplicationController
  before_filter :permission
  # GET /chronology_items
  # GET /chronology_items.xml
  def index
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_items = @chronology.chronology_items.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chronology_items }
    end
  end

  # GET /chronology_items/1
  # GET /chronology_items/1.xml
  def show
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_item = @chronology.chronology_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chronology_item }
    end
  end

  # GET /chronology_items/new
  # GET /chronology_items/new.xml
  def new
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_item = @chronology.chronology_items.build
    @page_section = @chronology.page_section

    respond_to do |format|
      format.js   { render :partial => 'ajax_new' }
      format.html # new.html.erb
      format.xml  { render :xml => @chronology_item }
    end
  end

  # GET /chronology_items/1/edit
  def edit
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_item = @chronology.chronology_items.find(params[:id])
    @page_section = @chronology.page_section
    @page = @page_section.page
    @site_section = @page.site_section
  end

  # POST /chronology_items
  # POST /chronology_items.xml
  def create
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_item = @chronology.chronology_items.build(params[:chronology_item])
    @page_section = @chronology.page_section
    

    respond_to do |format|
      if @chronology_item.save
        flash[:notice] = 'ChronologyItem was successfully created.'
        format.js { render :template => 'page_sections/ajax_success' }
        format.html { redirect_to chronology_url(@chronology_item.chronology_id) }
        format.xml  { render :xml => @chronology_item, :status => :created, :location => @chronology_item }
      else
        format.js { render :update do |page|
          page.replace_html "chronology_item_form_container_#{@chronology.id}", :partial => 'ajax_new', :chronology_id => @chronology, :page_section_id => @page_section
        end
        }
        format.html { render :action => "new" }
        format.xml  { render :xml => @chronology_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chronology_items/1
  # PUT /chronology_items/1.xml
  def update
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_item = @chronology.chronology_items.find(params[:id])
    @page_section = @chronology.page_section
    
    @page = @page_section.page
    @site_section = @page.site_section
    
    respond_to do |format|
      if @chronology_item.update_attributes(params[:chronology_item])
        flash[:notice] = 'ChronologyItem was successfully updated.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.js { render :update do |page|
          page.replace_html "chronology_item_form_container_#{@chronology.id}", :partial => 'ajax_edit', :chronology_id => @chronology, :page_section_id => @page_section
        end
        }
        format.xml  { render :xml => @chronology_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chronology_items/1
  # DELETE /chronology_items/1.xml
  def destroy
    @chronology = Chronology.find(params[:chronology_id])
    @chronology_item = @chronology.chronology_items.find(params[:id])
    @page_section = @chronology.page_section
    
    @chronology_item.destroy

    respond_to do |format|
      format.html { redirect_to chronology_url(@chronology_item.chronology_id) }
      format.js { render :template => 'page_sections/ajax_success' }
      format.xml  { head :ok }
    end
  end
  
  def order
   	list = 'chronology_' + params[:chronology_id]
     params[list.to_sym].each_with_index do |id, position|
      ChronologyItem.update(id, {:position => position+1})
     end
     render :text => params.inspect
   end

   def inspect_params
     render :text => params.inspect
   end
end
