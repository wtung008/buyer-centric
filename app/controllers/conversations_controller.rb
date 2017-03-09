class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @offers = Offer.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:seller_id],params[:buyer_id])
      .present?
      @conversation = Conversation.between(params[:seller_id],
        params[:buyer_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:seller_id, :buyer_id)
    end
end
