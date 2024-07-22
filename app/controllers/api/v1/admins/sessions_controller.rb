class Api::V1::Admins::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    self.resource = warden.authenticate(auth_options)
    return render json: { success: false, message: 'Invalid email or password.'},
                  status: :unprocessable_entity unless resource
    sign_in(resource_name, resource)
    respond_with resource
  end

  private

  def respond_with(resource, _opts = {})
    return render json: { success: false, errors: resource.errors }, status: :unprocessable_entity if resource.errors.any?
    render json: { success: true, message: 'Logged in successfully.', user: resource }
  end

  def respond_to_on_destroy
    render json: { success: true, message: 'Successfully logged out.' }
  end
end
