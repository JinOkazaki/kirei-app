class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    # if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
    if  Entry.exists?(user: current_user, room_id: params[:message][:room_id])
      @message = Message.create(message_params)
      ActionCable.server.broadcast "message_channel", message: @message
    else
      # flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_to room_path(@message.room_id)
    end
    # redirect_to room_path(@message.room_id)
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end
end
