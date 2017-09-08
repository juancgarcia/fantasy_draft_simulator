class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
    @player.plays_on.create(team: team)
    redirect_to players_path
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # It's kind of hacky to use a global variable for the round counter
  # It also doesn't reset, so if we went on to build a new league it would
  # keep counting up
  # $round = 0
  def draft
    @league = League.find(params[:league_id])
    # Let's store and read the round inside of the League object
    round = @league.round
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:player_id])
    next_index = @league.drafting_index
    # @next_index = params[:index].to_i
    # store the original index to optionally restore later
    current_index = next_index

    # Solution to allow each round to include all teams instead of skipping
    # the first team's selection at the beginning of the round

    # even round
    if round % 2 == 0
      # count up to last team
      next_index += 1
      # on last team selection:
      if current_index == @league.teams.count - 1
        # leave current team id for starting selection on next round
        next_index = current_index
        # and increment round counter
        round += 1
      end
    # odd round
    else
      # count down to first team
      next_index -= 1
      # on last first selection:
      if current_index == 0
        # leave current team id for starting selection on next round
        next_index = current_index
        # and increment round counter
        round += 1
      end
    end

    # if @next_index.to_i == 11
    #   $round += 1
    # elsif @next_index.to_i == 0
    #   $round += 1
    # end
    #
    #
    # if $round % 2 == 0
    #   @next_index = params[:index].to_i - 1
    # elsif $round % 2 != 0
    #   @next_index = params[:index].to_i + 1
    # end

    PlaysOn.create({
      team: @team,
      player: @player
    })

    # store round and drafting_index back into @league
    @league.update(round: round,  drafting_index: next_index)

    # remove index from url
    # redirect_to draft_league_path(@league, index: @next_index)
    redirect_to draft_league_path(@league)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:ranks, :name, :position, :nfl_team)
    end
end
