class QuotesController < ApplicationController
  before_filter :permission
  # GET /quotes
  # GET /quotes.xml
  def index
    @quote_list = QuoteList.find(params[:quote_list_id])
    @quotes = @quote_list.quotes.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.xml
  def show
    @quote_list = QuoteList.find(params[:quote_list_id])
    @quote = @quote_list.quotes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.xml
  def new
    @quote_list = QuoteList.find(params[:quote_list_id])
    @page_section = @quote_list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    @quote = @quote_list.quotes.build

    respond_to do |format|
      format.js   { render :partial => 'ajax_new' }
      format.html # new.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote_list = QuoteList.find(params[:quote_list_id])
    @page_section = @quote_list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    @quote = @quote_list.quotes.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.xml
  def create
    @quote_list = QuoteList.find(params[:quote_list_id])
    @quote = @quote_list.quotes.build(params[:quote])
    @page_section = @quote_list.page_section

    respond_to do |format|
      if @quote.save
        @page = @page_section.page
        @site_section = @page.site_section
        flash[:notice] = 'Quote was successfully created.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { render :xml => @quote, :status => :created, :location => @quote }
      else
        format.js { render :update do |page|
          page.replace_html "quote_form_container", :partial => 'ajax_new', :quote_list_id => @quote_list, :page_section_id => @page_section
        end
        }
        format.html { render :action => "new" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote_list = QuoteList.find(params[:quote_list_id])
    @quote = @quote_list.quotes.find(params[:id])
    @page_section = @quote_list.page_section
    @page = @page_section.page
    @site_section = @page.site_section

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { head :ok }
      else
        format.js { render :update do |page|
          page.replace_html "list_item_form_container", :partial => 'ajax_new', :list_id => @list, :page_section_id => @page_section
        end
        }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote_list = QuoteList.find(params[:quote_list_id])
    @quote = @quote_list.quotes.find(params[:id])
    @page_section = @quote_list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to site_section_page_url(@site_section, @page) }
      format.js { render :template => 'page_sections/ajax_success' }
      format.xml  { head :ok }
    end
  end
  
  def order
  	list = 'quote_list_' + params[:quote_list_id]
    params[list.to_sym].each_with_index do |id, position|
     Quote.update(id, {:position => position+1})
    end
    render :text => params.inspect
  end
 
  def inspect_params
    render :text => params.inspect
  end
end
