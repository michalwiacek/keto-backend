class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    respond_to do |format|
      format.html do
        super
      end
      format.json do
        super { @token = current_token }
      end
    end
  end

  def show; end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
