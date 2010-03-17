class MessagesController < ApplicationController

  before_filter :require_auth

  def create
    @chat = Chat.find(params[:chat_id])

    forbid! unless allowed_to_reply? @chat

    @message = @chat.messages.new(params[:message])
    @message.author = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @chat, :notice => 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  protected

  def allowed_to_reply?(chat)
    chat.users.include?(current_user)
  end
end
