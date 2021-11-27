class ConversationsController < ApplicationController
  before_action  :set_prospect, only: [:new, :create, :index]
 
  def new
    # necesitamos el prospecto en el simple_form_for
    @conversation = Conversation.new
  end
        
  def create
    @conversation = @prospect.conversations.create(params_conversation)
    if @conversation.save
      flash[:success] = "Mensaje creado exitosamente"
      redirect_to prospect_conversations_path(@prospect)
    else
      flash[:error] = "algo salió mal"
      render 'new'
    end
  end
      
  def index
    @conversations = Conversation.where(prospect_id: @prospect.id)
  end
      
    
  private
    
  def params_conversation
    params.require(:conversation).permit(:message)
  end

  def set_prospect
    @prospect = Prospect.find(params[:prospect_id])
  end
end
