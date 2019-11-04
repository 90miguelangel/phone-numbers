class PhonesController < ApplicationController

  def index
    render json: Phone.page(params[:page])
  end

  def create
    phone = Phone.request_number(params[:number])
    if phone.errors.any?
      render json: phone.errors, status: :unprocessable_entity
    else
      render json: phone, status: :created
    end
  end

end
