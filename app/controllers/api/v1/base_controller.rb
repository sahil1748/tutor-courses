class Api::V1::BaseController < ApplicationController
  protected
  def paginate(resources)
    resources.page(params[:page] || 1).per((params[:per_page] || 5))
  end
end