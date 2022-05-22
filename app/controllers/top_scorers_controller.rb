class TopScorersController < ApplicationController
  def index
    matching_top_scorers = TopScorer.all

    @list_of_top_scorers = matching_top_scorers.order({ :created_at => :desc })

    render({ :template => "top_scorers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_top_scorers = TopScorer.where({ :id => the_id })

    @the_top_scorer = matching_top_scorers.at(0)

    render({ :template => "top_scorers/show.html.erb" })
  end

  def create
    the_top_scorer = TopScorer.new
    the_top_scorer.player_name = params.fetch("query_player_name")
    the_top_scorer.number_of_goals = params.fetch("query_number_of_goals")
    the_top_scorer.season_id = params.fetch("query_season_id")
    the_top_scorer.player_image = params.fetch("query_player_image")
    the_top_scorer.club_id = params.fetch("query_club_id")

    if the_top_scorer.valid?
      the_top_scorer.save
      redirect_to("/top_scorers", { :notice => "Top scorer created successfully." })
    else
      redirect_to("/top_scorers", { :alert => the_top_scorer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_top_scorer = TopScorer.where({ :id => the_id }).at(0)

    the_top_scorer.player_name = params.fetch("query_player_name")
    the_top_scorer.number_of_goals = params.fetch("query_number_of_goals")
    the_top_scorer.season_id = params.fetch("query_season_id")
    the_top_scorer.player_image = params.fetch("query_player_image")
    the_top_scorer.club_id = params.fetch("query_club_id")

    if the_top_scorer.valid?
      the_top_scorer.save
      redirect_to("/top_scorers/#{the_top_scorer.id}", { :notice => "Top scorer updated successfully."} )
    else
      redirect_to("/top_scorers/#{the_top_scorer.id}", { :alert => the_top_scorer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_top_scorer = TopScorer.where({ :id => the_id }).at(0)

    the_top_scorer.destroy

    redirect_to("/top_scorers", { :notice => "Top scorer deleted successfully."} )
  end
end
