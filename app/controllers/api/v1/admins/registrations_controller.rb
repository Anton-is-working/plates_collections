class Api::V1::Admins::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  before_action :request_type
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    return render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity if resource.errors.any?
    return render json: { success: true,
                          message: "User destroyed successfully"} if resource.destroyed?
    return render json: { success: false,
                          message: "User couldn't be created successfully.",
                          errors: resource.errors.full_messages }, status: :unprocessable_entity unless resource.persisted?
    render json: { success: true, message: 'Signed up successfully.', user: resource }
  end

  def request_type
    RequestStore.store[:request_type] = :api
  end
end
