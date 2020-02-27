class MessagesController < ApplicationController
  layout 'application'
  before_action :authenticate_account!

  def index
    @data = Message.page(params[:page]).per(15).order(created_at: "DESC")
    @alluser = Account.all
    @message = Message.new
  end

  def create
    @message = current_account.messages.build message_params
    if @message.save 
      flash[:success] = 'メッセージが送信されました'
      redirect_to '/messages'
    else
      flash[:danger] = 'メッセージを入力してください'
      redirect_to '/messages'
    end
  end

  def download
    @picture = Message.find(params[:id])
    filepath = @picture.picture.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @picture.picture_identifier, :length => stat.size)
  end

  private

  def message_params
    params.require(:message).permit(:message,:picture)
  end


end
