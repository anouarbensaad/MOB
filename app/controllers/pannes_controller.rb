class PannesController < ApplicationController
  before_action :set_panne, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :show, :edit, :update, :destroy]
  before_action :prof_user, only: [:create]
  before_action :can_edit, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  # GET /pannes
  # GET /pannes.json
  def index
    if logged_in?
      @pannes = Panne.paginate(page: params[:page], :per_page => 10)
    else
      redirect_to home_url
    end
  end

  # GET /pannes/1
  # GET /pannes/1.json
  def show
    
  end

  # GET /pannes/new
  def new
    @action='new'
    @panne = Panne.new
  end

  # GET /pannes/1/edit
  def edit
    @action='edit'
    @panne = Panne.find(params[:id])
  end

  # POST /pannes
  # POST /pannes.json
  def create
    panne_params[:panne_status]='Non Résolue';
    panne_params[:tech_id]='1';
    @panne = current_user.created_pannes.build(panne_params)
    if @panne.save
      flash[:success] = "Panne cree!"
      redirect_to root_url
    else
      @action='new'
      render 'new'
    end
    
  end

  # PATCH/PUT /pannes/1
  # PATCH/PUT /pannes/1.json
  def update
    @panne = Panne.find(params[:id])
    panne_params[:tech_id]=current_user.id
    if @panne.update_attributes(panne_params)
      flash[:success] = "Panne mis à jour avec succès"
      redirect_to @panne
    else
      render 'edit'
    end 
  end

  # DELETE /pannes/1
  # DELETE /pannes/1.json
  def destroy
    @panne = Panne.find(params[:id])
    @panne.destroy
    respond_to do |format|
      format.html { redirect_to pannes_url, notice: 'Panne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panne
      begin
        @panne = Panne.find(params[:id])
      rescue
        redirect_to root_url
      end
    end

    def can_edit
      unless is_technician? && @panne.panne_status != 'Résolue'
        flash[:danger] = "Vous n'êtes pas autorisé."
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panne_params
      @panne_params ||=params.require(:panne).permit(:description, :type_panne, :laboratoire, :type_Composant, :id_Composant, :tech_id, :panne_status, :tech_comment)
    end
end
