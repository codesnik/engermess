class ChatsController < ApplicationController

  before_filter :require_auth

  # GET /chats
  def index
    @chats = current_user.chats.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /chats/1
  def show
    @chat = Chat.find(params[:id])

    respond_to do |format|
      format.html do # show.html.erb
        # should be done AFTER render, actually
        # TODO find a hook for that
        @chat.read_by(current_user)
      end
    end
  end

  # GET /chats/new
  def new
    @chat = Chat.new
    @message = @chat.messages.build
    @user_id = params[:user_id]

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /chats
  def create
    @chat = Chat.new(params[:chat])
    @message = @chat.messages.build(params[:message])
    @user_id = params[:user_id]
    recipient = User.find_by_id(@user_id)
    @chat.users = current_user, recipient
    @message.author = current_user

    respond_to do |format|
      if @chat.save
        format.html { redirect_to(@chat, :notice => 'Chat was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /chats/1
  def destroy
    @chat = Chat.find(params[:id])
    @chat.part_by(current_user)

    respond_to do |format|
      format.html { redirect_to(chats_url) }
    end
  end
end
