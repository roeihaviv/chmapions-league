# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  season_year :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stadium_id  :integer
#
class Season < ApplicationRecord

  has_many(:top_scorers, { :class_name => "TopScorer", :foreign_key => "season_id", :dependent => :destroy })

  has_many :final_stadium

  belongs_to(:stadium, { :required => true, :class_name => "FinalStadium", :foreign_key => "stadium_id" })
end
