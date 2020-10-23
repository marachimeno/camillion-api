# Controller to manage routes requests for news
module Api
  module V1
    class NewsController < Api::V1::BaseController
      # Use set_new method as the first thing on the show method
      before_action :set_new, only: [:show]

      # GET all news
      def index
        # Scoping news for logged in users
        @news = policy_scope(New)
      end

      # GET a specific new
      def show
        # Authorizing that only logged in users can see that new
        authorize @new
      end

      # POST a created new
      def create
        # Creating a new with strong params
        @new = New.new(new_params)
        # Assinging that new to a specific user
        @new.user = User.first

        # Authorizing that only admin users can create a new
        authorize @new

        # If new is created and saved
        if @new.save
          # Show the specific new just created
          render :show, status: :created
        else
          # Show an error on the creation of the new
          render_error
        end
      end

      private

      # Finding a specific new to use on show method
      def set_new
        # Finding a new through the params id
        @new = New.find(params[:id])
      end

      # Strong params for new
      def new_params
        # Only allow the user to edit the title and the contetn of a new
        params.require(:new).permit(:title, :content)
      end
    end
  end
end
