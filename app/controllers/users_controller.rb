class UsersController < ApplicationController 
  before_action :logged_in_user, only: [:create, :show, :index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user, only: [:create, :index, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], :per_page => 5)

  end

  # GET /users/1
  # GET /users/1.json
  def show
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to root_url
    end
  end

  # GET /users/new
  def new
    @action='new'
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @action='edit'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Utilisateur crèe avec succès!"
      redirect_to users_url
    else
      @action='new'
      render 'new'
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Compte mis à jour avec succès"
      redirect_to @user
    else
      render 'edit'
    end    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé avec succès."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :nom, :prenom, :email, :utype, :password, :password_confirmation)
    end

end
