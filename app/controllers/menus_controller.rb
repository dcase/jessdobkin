class MenusController < ApplicationController
  def get_menu
     @site_sections = SiteSection.find(:all, :order => :position)
     
     respond_to do |format|
       format.html { render :partial => 'common/blog_menu' }# index.html.erb
       format.json { render :json => @site_sections }
       format.xml  { render :xml => @site_sections }
     end
  end
end