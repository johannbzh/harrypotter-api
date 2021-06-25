class Api::V1::CharactersController < Api::V1::BaseController
  def index
    @characters = policy_scope(Character)
    if params[:query].present?
      sql_query = "name ILIKE :query OR house ILIKE :query"
      @characters = Character.where(sql_query, query: "%#{params[:query]}%")
    else
      @characters = Character.all
    end
  end

  def show
    @character = Character.find(params[:id])
    authorize @character
  end
end
