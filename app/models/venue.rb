class Venue < ApplicationRecord
  has_many :shows
  has_many :movies, through: :shows  
  def create_seating(rowspan,colspan)
      cols = []
      venue_data = {}
      venue_data["venue"] = {"layout": {rows: rowspan, columns: colspan}}
      venue_data["seats"] = {}
      alps = ('a'..'z').to_a
      rows = alps[0...rowspan]
      1.step(colspan) { |i| cols << i }
      rows.each do |i|
          cols.each do |j|
              k = (i+j.to_s)
              venue_data["seats"][k] ||= {}
              venue_data["seats"][k] = {"id": k,"row":i,"column": j, "status":"AVAILABLE"}
          end
      end
      return venue_data
  end
end
