class FinalStadiaController < ApplicationController
  def index
    matching_final_stadia = FinalStadium.all

    @list_of_final_stadia = matching_final_stadia.order({ :created_at => :desc })

    render({ :template => "final_stadia/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_final_stadia = FinalStadium.where({ :id => the_id })

    @the_final_stadium = matching_final_stadia.at(0)

    render({ :template => "final_stadia/show.html.erb" })
  end

  def create
    the_final_stadium = FinalStadium.new
    the_final_stadium.stadium_name = params.fetch("query_stadium_name")
    the_final_stadium.city = params.fetch("query_city")
    the_final_stadium.stadium_image = params.fetch("query_stadium_image")
    the_final_stadium.number_of_seats = params.fetch("query_number_of_seats")

    if the_final_stadium.valid?
      the_final_stadium.save
      redirect_to("/final_stadia", { :notice => "Final stadium created successfully." })
    else
      redirect_to("/final_stadia", { :alert => the_final_stadium.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_final_stadium = FinalStadium.where({ :id => the_id }).at(0)

    the_final_stadium.stadium_name = params.fetch("query_stadium_name")
    the_final_stadium.city = params.fetch("query_city")
    the_final_stadium.stadium_image = params.fetch("query_stadium_image")
    the_final_stadium.number_of_seats = params.fetch("query_number_of_seats")

    if the_final_stadium.valid?
      the_final_stadium.save
      redirect_to("/final_stadia/#{the_final_stadium.id}", { :notice => "Final stadium updated successfully."} )
    else
      redirect_to("/final_stadia/#{the_final_stadium.id}", { :alert => the_final_stadium.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_final_stadium = FinalStadium.where({ :id => the_id }).at(0)

    the_final_stadium.destroy

    redirect_to("/final_stadia", { :notice => "Final stadium deleted successfully."} )
  end
end
