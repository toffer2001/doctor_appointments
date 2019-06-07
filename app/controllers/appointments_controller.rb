class AppointmentsController < ApplicationController

before_action :set_user

  def index
    @appointments = @user.appointments.all
  end

  def show
  end

  def new
    @appointment = @user.appointments.new
    render partial: 'form'
  end

  def create
    @appointment = @user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to user_appointments_path(@user)
    else
      render partial: "form"
    end
  end

  def destroy
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to user_appointments_path(@user)

  end

  def edit
    @appointment = Appointment.find(params[:id])
    render partial: "form"
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to user_appointments_path(@user)
    else
      render :edit
    end

  end

  private
  
  def set_user
    @user = User.find(params[:user_id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_description, :user_id)
  end

end
