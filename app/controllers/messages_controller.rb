class MessagesController < ApplicationController
  layout 'application'
  before_action :authenticate_account!

  def index
    @data = Message.page(params[:page]).per(11).order(created_at: "ASC")
    
    @message = Message.new
  end

  def add
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    @message.account_id = current_account.id
    if @message.save 
      redirect_to '/messages'
    else
      redirect_to '/messages'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
