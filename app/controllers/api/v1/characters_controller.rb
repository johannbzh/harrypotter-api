class Api::V1::CharactersController < Api::V1::BaseController
  def index
    @characters = policy_scope(Character)
  end

  def show
    @character = Character.find(params[:id])
    authorize @character
  end
end
