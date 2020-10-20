class Api::V1::NewsController < Api::V1::BaseController
  before_action :set_new, only: [:show]

  def index
    @news = policy_scope(New)
  end


  def show
  end

  private

  def set_new
    @new = New.find(params[:id])
    authorize @new  # For Pundit
  end
end
