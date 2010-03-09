class MessagesController < ApplicationController

  before_filter :require_auth

  def create
    @chat = Chat.find(params[:chat_id])
    @message = current_user.messages.new(params[:message])
    @message.chat = @chat
    respond_to do |format|
      if @message.save
        format.html { redirect_to @chat }
      else
        format.html { render :new }
      end
    end
  end
end
