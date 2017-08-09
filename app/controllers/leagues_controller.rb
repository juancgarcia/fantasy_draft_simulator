class LeaguesController < ApplicationController

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])
  end

  # GET /leagues/new
  def new
    league_name = (1 + rand(10000))
    @league = League.new(name: "League #{league_name}")
    @players = Player.all
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.create(league_params)
    @league.add_teams
    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  def draft
    @league = League.find(params[:id])
    @teams = @league.teams
    @drafted_players = []
    @league.teams.each{ |t|
      t.players.each{ |j|
        @drafted_players << j.id}
      }
    @players = Player.where.not(:id => @drafted_players)
    @index = params[:index].to_i || 0
    @current_team = @teams[@index]
    @positions = ['QB', 'RB', 'WR', 'TE', 'DEF', 'PK']
    @all_players = Player.all
    @rbs = @all_players.where(:position => 'RB')
    @wrs = @all_players.where(:position => 'WR')
    @qbs = @all_players.where(:position => 'QB')
    @defs = @all_players.where(:position => 'DEF')
    @pks = @all_players.where(:position => 'PK')
    @tes = @players.where(:position => 'TE')
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:name)
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
