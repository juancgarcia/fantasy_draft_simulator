class TeamsController < ApplicationController
  # Now that the teams route is nested under leagues, we need a reference to the
  # selected league
  before_action :set_league
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    # Instead of all teams, fetch only teams belonging to the current league
    # @teams = Team.all
    @teams = @league.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    # Scope the new team to our current league
    # @team = Team.new(team_params)
    @team = @league.teams.new(team_params)

    respond_to do |format|
      if @team.save
        # path needs to be updated to reference league
        format.html { redirect_to league_team_path(@league, @team), notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        # path needs to be updated to reference league
        format.html { redirect_to league_team_path(@league, @team), notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      # path needs to be updated to reference league
      format.html { redirect_to league_teams_url(@league), notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Find the selected league via url param
    def set_league
      @league = League.find(params[:league_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
