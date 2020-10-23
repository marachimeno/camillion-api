#  Controller with shared logic for the rest of controllers
module Api
  module V1
    class BaseController < ActionController::API
      include Pundit

      # Pundit method to verify if the user is authorized to the API
      # used in every method except in index method
      after_action :verify_authorized, except: :index

      #  Pundit method to verify the user and scope accordingly
      # only used in index method
      after_action :verify_policy_scoped, only: :index

      # Error for when user is not authorized
      rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
      # Error for when user is not found
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def user_not_authorized(exception)
        # Creates json message for when user is not authorized
        render json: {
          error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
        }, status: :unauthorized
      end

      def not_found(exception)
        # Creates json message for when user is not found
        render json: { error: exception.message }, status: :not_found
      end
    end
  end
end
