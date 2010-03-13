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
    @chat = current_user.chats.new
    @message = @chat.messages.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /chats/1/edit
  def edit
    @chat = Chat.find(params[:id])
  end

  # POST /chats
  def create
    @chat = current_user.chats.new(params[:chat])
    @message = @chat.messages.build(params[:message])
    @message.author = current_user

    respond_to do |format|
      if @chat.save
        format.html { redirect_to(@chat, :notice => 'Chat was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /chats/1
  def update
    @chat = Chat.find(params[:id])

    respond_to do |format|
      if @chat.update_attributes(params[:chat])
        format.html { redirect_to(@chat, :notice => 'Chat was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /chats/1
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to(chats_url) }
    end
  end
end
