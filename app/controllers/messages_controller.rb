class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if  Entry.exists?(user: current_user, room_id: params[:message][:room_id])
      @message = Message.create(message_params)
      ActionCable.server.broadcast "message_channel", message: @message
    else
      redirect_to room_path(@message.room_id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end
end
