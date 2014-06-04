class ListsController < ApplicationController

  def create
    list_params = secure_user_input(params[:list])
    @list = List.new(list_params)
    if @list.save
        flash[:notice] = "Your list was created"
    else
        flash[:alert] = "There was an error creating your list."
    end
    redirect_to(list_tasks_url(@list))
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
    end
  end

  protected
  def secure_user_input(list_params)
    list_params[:name] = list_params[:name].replace(CGI::escapeHTML(list_params[:name]))
    list_params
  end
end
