class MessageGroupsController < ApplicationController
  before_action :set_message_group, only: [:show, :message_create]
  PER = 10

  def index
    @message_groups = current_user.message_groups.page(params[:page]).per(PER)
  end


  def new
    @message_group = MessageGroup.new
  end

  def create
    @message_group = MessageGroup.new(message_group_params)
    @message_group.user_message_groups.new(user_id: current_user.id)
    @message_group.save
    redirect_to message_group_path(@message_group)
  end

  def show
    @message = @message_group.messages.new
    @messages = Message.includes(:sender).where(message_group_id: @message_group).newer
  end

  def message_create
    @message = @message_group.messages.new(message_params)
    @message.sender_id = current_user.id
    @message.save
    redirect_back(fallback_location: root_path)
  end


  private

    def set_message_group
      @message_group = MessageGroup.find(params[:id])
    end

    def message_group_params
      params.require(:message_group).permit(:name, :user_ids)
    end

    def message_params
      params.require(:message).permit(:comment)
      # .merge(sender_id: current_user.id)
    end
end
