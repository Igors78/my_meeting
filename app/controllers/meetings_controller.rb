# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy invite_user]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @users = User.all
  end

  # GET /meetings/new
  def new
    @meeting = current_user.meetings.new
  end

  # GET /meetings/1/edit
  def edit; end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = current_user.meetings.build(meeting_params)
    if @meeting.save
      flash[:success] = 'Meeting has been created!'
      redirect_to @meeting
    else
      render 'new'
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @meeting = current_user.meetings.find(params[:id])
    if @meeting.update_attributes(meeting_params)
      flash[:success] = 'Meeting updated'
      redirect_to @meeting
    else
      render 'edit'
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = current_user.meetings.find(params[:id])
    if @meeting
      @meeting.destroy
      flash[:success] = 'Meeting has been deleted'
    else
      flash[:alert] = 'Error'
    end
    redirect_to root_path
  end

  def invite_user
    @user = User.find(params[:user_id])
    @meeting.invited_users << @user
    flash.notice = " #{@user.name} invited!!!"
    redirect_to "/meetings/#{@meeting.id}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    params.require(:meeting).permit(:content)
  end
end
