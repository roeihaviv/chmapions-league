# == Schema Information
#
# Table name: clubs
#
#  id            :integer          not null, primary key
#  club_name     :string
#  founding_year :string
#  logo          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stadium_id    :integer
#
class Club < ApplicationRecord

  has_many(:top_scorers, { :class_name => "TopScorer", :foreign_key => "club_id", :dependent => :destroy })

  has_many(:coaches, { :class_name => "Coach", :foreign_key => "club_id", :dependent => :destroy })

  belongs_to(:stadium, { :required => true, :class_name => "FinalStadium", :foreign_key => "stadium_id" })
end
