class StatsController < ApplicationController
  def create
    @stat = Stat.new(stat_params)

    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stats successfully created.' }
        format.json { render :show, status: :created, location: @stat }
      else
        format.html { render :new }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @stat = Stat.find_by_nba_player_id(params[:nba_player_id])
    respond_to do |format|
      if @stat.update(stats_params)
        format.html { redirect_to @stat, notice: 'Stats successfully updated.' }
        format.json { render :show, status: :ok, location: @stats }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private

  def stats_params
    params.require(:stats).permit(:nba_player_id, :games_played, :games_started, :minutes, :fgm, :fga, :fg_pct, :fg3m, :fg3a, :fg_3pct, :ftm, :fta, :ft_pct, :oreb, :dreb, :reb, :ast, :steal, :blk, :tov, :pf, :pts)
  end
end
