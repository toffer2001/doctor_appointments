class DoctorsController < ApplicationController

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    # before_action
  end

  def new
    @doctor = Doctor.new

    render partial: 'form'

  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  
  def edit
    # before_action

    render partial: 'form'
  end

  def update
    # before_action
    if @doctor.update(doctor_params)
      redirect_to doctors_path
    else
      render :edit
    end

  end

  def destroy
    # before_action
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name)
  end

end
