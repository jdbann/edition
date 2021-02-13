class EntriesController < ApplicationController
  def index
    @entries = policy_scope(Entry.latest_first)
  end

  def show
    @entry = Entry.find(params[:id])
    authorise @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    authorise @entry

    @entry.destroy
    redirect_to entries_path
  end
end
