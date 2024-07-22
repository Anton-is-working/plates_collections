module Api
  class BaseController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    respond_to :json

    def authenticate_user!(*)
      unless admin_signed_in?
        respond_to do |format|
          format.json do
            render json: { success: false, message: 'You need to sign in or sign up before continuing.' },
                   status: 401
          end
        end
      end
    end
  end
end
