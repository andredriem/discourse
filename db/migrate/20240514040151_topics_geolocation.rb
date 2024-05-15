class TopicsGeolocation < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'postgis'
    # add to topic this:
    #   t.st_point :lonlat, geographic: true
    add_column :topics, :lonlat, :st_point, geographic: true
    add_index :topics, :lonlat, using: :gist
    # add icon column to topic
    add_column :topics, :icon, :string, index: true
  end
end
