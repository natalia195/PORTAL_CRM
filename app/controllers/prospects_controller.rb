class ProspectsController < ApplicationController
    before_action  :set_prospect, only: [:edit, :update, :destroy]

    def index
      #  @prospects = Prospect.all
      #  @prospects = @prospects&.order(created_at: :desc)
        @prospects = Prospect.all.paginate(page: params[:page], per_page: 5).order('created_at DESC')
        @onprospects = Prospect.where("status = ?", "Prospecto")
        @interested = Prospect.where("status = ?", "Muy interesado")
        @clients = Prospect.where("status = ?", "Cliente")
        @prospects.paginate(:page => 10, :per_page => 5)
    end

    def new
        @prospect = Prospect.new
    end

    def create
        @user = current_user
        @prospect = @user.prospects.create(prospect_params)
        if @prospect.save
        flash[:success] = "Prospecto creado exitosamente"
        redirect_to prospects_path
        else
        flash[:error] = "Algo salió mal"
        render 'new'
        end
    end

    
    def edit
    end

    def update
        if @prospect.update(prospect_params)
        redirect_to prospects_path
        else
        render :edit
        end
    end

    def destroy
        @prospect.destroy

        redirect_to root_path
    end

    private

    def prospect_params
        params.require(:prospect).permit(:first_name, :last_name, :phone, :email, :status)    
    end

    def set_prospect
        @prospect = Prospect.find(params[:id])
    end
end
