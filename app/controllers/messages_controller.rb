class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, only: [:index, :show, :new, :edit, :create, :update]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @received_messages = Message.where(receiver_id:current_user.id, message_holder_id:current_user.id)
    @sent_messages = Message.where(sender_id:current_user.id, message_holder_id:current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    if @message.message_holder_id != current_user.id
      redirect_to :root, notice:'you are trying to view other user message'
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create

    # Two copies of the message, one for sender and one for receiver so that operations don't apply for both users' messages
    user = User.find_by(username:message_params[:receiver_name])
    if user != nil and current_user != nil and user != current_user
      @message_sender = Message.new(message_params)
      @message_sender.receiver_id = user.id
      @message_sender.sender_id = current_user.id
      @message_sender.message_holder_id = current_user.id

      @message_receiver = Message.new(message_params)
      @message_receiver.receiver_id = user.id
      @message_receiver.sender_id = current_user.id
      @message_receiver.message_holder_id = user.id

      respond_to do |format|
        if @message_sender.save and @message_receiver.save
          format.html { redirect_to @message_sender, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message_sender }
        else
          format.html { render :new }
          format.json { render json: @message_sender.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to messages_path, notice: "this user doesn't exist or you are trying to send message to yourself"
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    if @message.message_holder_id == current_user.id
      @message.destroy
      respond_to do |format|
        format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to :root, notice:'you are trying to view other user message'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:topic, :body, :receiver_name)
    end
end
