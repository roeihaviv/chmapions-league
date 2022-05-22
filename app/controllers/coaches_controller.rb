class CoachesController < ApplicationController
  def index
    matching_coaches = Coach.all

    @list_of_coaches = matching_coaches.order({ :created_at => :desc })

    render({ :template => "coaches/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_coaches = Coach.where({ :id => the_id })

    @the_coach = matching_coaches.at(0)

    render({ :template => "coaches/show.html.erb" })
  end

  def create
    the_coach = Coach.new
    the_coach.coach_name = params.fetch("query_coach_name")
    the_coach.club_id = params.fetch("query_club_id")

    if the_coach.valid?
      the_coach.save
      redirect_to("/coaches", { :notice => "Coach created successfully." })
    else
      redirect_to("/coaches", { :alert => the_coach.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_coach = Coach.where({ :id => the_id }).at(0)

    the_coach.coach_name = params.fetch("query_coach_name")
    the_coach.club_id = params.fetch("query_club_id")

    if the_coach.valid?
      the_coach.save
      redirect_to("/coaches/#{the_coach.id}", { :notice => "Coach updated successfully."} )
    else
      redirect_to("/coaches/#{the_coach.id}", { :alert => the_coach.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_coach = Coach.where({ :id => the_id }).at(0)

    the_coach.destroy

    redirect_to("/coaches", { :notice => "Coach deleted successfully."} )
  end
end
