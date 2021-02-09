class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    entry = Current.account.entries.new(
      entryable: @message
    )

    if @message.valid? && entry.save
      redirect_to entry_path(entry)
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      redirect_to entry_path(@message.entry)
    else
      render :edit
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
