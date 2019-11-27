# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    respond_to do |format|
      format.html { super }
      format.json { super { @token = current_token } }
    end
  end

  def show; end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
