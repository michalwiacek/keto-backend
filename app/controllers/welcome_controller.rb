# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect_to admin_root_url
  end
end
