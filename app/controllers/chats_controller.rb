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
      format.html # show.html.erb
    end
  end

  # GET /chats/new
  def new
    @chat = Chat.new
    @message = @chat.messages.build
    @recipient = User.find_by_id(params[:user_id] || params[:recipient])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /chats
  def create
    @chat = Chat.new(params[:chat])
    @message = @chat.messages.build(params[:message])
    @recipient = User.find_by_id(params[:recipient])
    @chat.users = current_user, @recipient
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
