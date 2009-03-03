class ArticleListItemsController < ApplicationController
  before_filter :permission
  
  # GET /article_list_items
  # GET /article_list_items.xml
  def index
    @article_list = ArticleList.find(params[:article_list_id])
    @article_list_items = @article_list.article_list_items.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @article_list_items }
    end
  end

  # GET /article_list_items/1
  # GET /article_list_items/1.xml
  def show
    @article_list = ArticleList.find(params[:article_list_id])
    @article_list_item = @article_list.article_list_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article_list_item }
    end
  end

  # GET /article_list_items/new
  # GET /article_list_items/new.xml
  def new
    @article_list = ArticleList.find(params[:article_list_id])
    @page_section = @article_list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    
    @article_list_item = @article_list.article_list_items.build
    @article_list_item.articles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article_list_item }
    end
  end

  # GET /article_list_items/1/edit
  def edit
    @article_list = ArticleList.find(params[:article_list_id])
    @page_section = @article_list.page_section
    @page = @page_section.page
    @site_section = @page.site_section
    
    @article_list_item = @article_list.article_list_items.find(params[:id])
    
  end

  # POST /article_list_items
  # POST /article_list_items.xml
  def create
    @article_list = ArticleList.find(params[:article_list_id])
    @page_section = @article_list.page_section
    
    @article_list_item = @article_list.article_list_items.build(params[:article_list_item])

    respond_to do |format|
      if @article_list_item.save
         @page = @page_section.page
          @site_section = @page.site_section
        flash[:notice] = 'ArticleListItem was successfully created.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { render :xml => @article_list_item, :status => :created, :location => @article_list_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article_list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /article_list_items/1
  # PUT /article_list_items/1.xml
  def update
    @article_list = ArticleList.find(params[:article_list_id])
    @page_section = @article_list.page_section
    
    @article_list_item = @article_list.article_list_items.find(params[:id])

    respond_to do |format|
      if @article_list_item.update_attributes(params[:article_list_item])
        @page = @page_section.page
        @site_section = @page.site_section
        flash[:notice] = 'ArticleListItem was successfully updated.'
        format.html { redirect_to site_section_page_url(@site_section, @page) }
        format.js { render :template => 'page_sections/ajax_success' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article_list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /article_list_items/1
  # DELETE /article_list_items/1.xml
  def destroy
    @article_list = ArticleList.find(params[:article_list_id])
    @page_section = @article_list.page_section
    
    @article_list_item = @article_list.article_list_items.find(params[:id])
    @article_list_item.destroy

    respond_to do |format|
      format.html { redirect_to article_list_url(@article_list_item.article_list_id) }
      format.js { render :template => 'page_sections/ajax_success' }
      format.xml  { head :ok }
    end
  end
  
  def order
  	list = 'article_list_' + params[:article_list_id]
    params[list.to_sym].each_with_index do |id, position|
     ArticleListItem.update(id, {:position => position+1})
    end
    render :text => params.inspect
  end
 
  def inspect_params
    render :text => params.inspect
  end
end
