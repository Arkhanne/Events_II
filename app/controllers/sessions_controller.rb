class SessionsController < ApplicationController
  def new
  end

  def create
    params[:email]
    params[:password]
  end
end
