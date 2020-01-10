class MessagesController < ApplicationController
  layout 'application'
  before_action :authenticate_account!

  def index
    total = Message.page(params[:page]).per(15).total_pages
    @data = Message.page(params[:page]).per(15).order(created_at: "DESC")
    
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
