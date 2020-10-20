class Api::V1::NewsController < Api::V1::BaseController
  before_action :set_new, only: [:show]

  def index
    @news = policy_scope(New)
  end


  def show
  end

  def create
    @new = New.new(new_params)
    @new.user = User.first

    authorize @new
    if @new.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_new
    @new = New.find(params[:id])
    authorize @new  # For Pundit
  end

  def new_params
    params.require(:new).permit(:title, :content)
  end
end
