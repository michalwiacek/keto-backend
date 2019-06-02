class Api::V1::ApplicationController < ActionController::API
  include Pundit
  include ActionController::MimeResponds
  respond_to :json
  
  rescue_from Pundit::NotAuthorizedError, with: :render_forbidden
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private

  def render_unprocessable_entity_response(exception)
    render_response(
      message: "Validation Failed",
      errors: ValidationErrorsSerializer.new(exception.record).serialize,
      status: :unprocessable_entity
    )
  end

  def render_not_found_response
    render_response(message: "Not Found",
                    status: :not_found)
  end

  def render_forbidden
    render_response(message: "Forbidden",
                    status: :forbidden)
  end

  def render_response(status:, obj: nil, errors: {}, message: nil)
    code = Rack::Utils.status_code(status)
    name = Rack::Utils::HTTP_STATUS_CODES[code]
    tmp = {}
    tmp[:body] = obj if obj.present?
    tmp[:errors] = errors if errors.present?
    tmp[:message] = message if message.present?
    tmp[:status] = { code: code, name: name }
    render json: tmp, status: code
  end
end
