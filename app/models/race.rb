class Race < ActiveRecord::Base
  belongs_to :pc
  belongs_to :master, class_name: "Master::Race", foreign_key: "master_race_id"

  delegate :name, to: :master_race
end
