# frozen_string_literal: true

class GraphqlController < ApplicationController
  protect_from_forgery except: :execute

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {} # current_user: current_user,
    result =
      KetoBackendSchema.execute(
        query,
        variables: variables, context: context, operation_name: operation_name
      )
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? ensure_hash(JSON.parse(ambiguous_param)) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: {
             error: { message: err.message, backtrace: err.backtrace }, data: {}
           },
           status: :internal_server_error
  end
end
