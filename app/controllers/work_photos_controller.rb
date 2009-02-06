class WorkPhotosController < ApplicationController

  def order
     list = 'work_thumbs_wrapper'
     params[list.to_sym].each_with_index do |id, position|
       WorkPhoto.update(id, {:position => position+1})
     end
     render :text => params.inspect
   end

   def inspect_params
    render :text => params.inspect
   end

   def destroy
     @work = Work.find(params[:work_id])
     @work_photo = @work.work_photos.find(params[:id])
     @photo = @work_photo.photo
     @photo.destroy

     respond_to do |format|
       format.html { redirect_to(@work) }
       format.xml  { head :ok }
     end
   end
   
end
