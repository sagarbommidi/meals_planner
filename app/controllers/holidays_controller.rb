class HolidaysController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :find_holiday, :only => [:edit, :update, :destroy]

  def index
    @holiday = Holiday.new
    get_holidays
  end

  def create
    @holiday = Holiday.new(params[:holiday])
    @holiday.save
    get_holidays
  end

  def edit
  end

  def update
    @holiday.update_attributes(params[:holiday])
    get_holidays
  end

  def destroy
    @holiday.destroy
    get_holidays
  end

  private

  def find_holiday
    @holiday = Holiday.find(params[:id])
  end

  def get_holidays
    @holidays = Holiday.all
  end
end
