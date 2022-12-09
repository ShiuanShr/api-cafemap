# frozen_string_literal: true

require 'sequel'

# Sequel.migration do
#   change do
#     create_table(:store) do
#       primary_key :id
#       foreign_key :info_id, :info

#       String      :place_id
#       String      :name
#       String      :formatted_address
#       String      :location_lat
#       String      :location_lng
#       Float       :rating
#       Integer     :user_ratings_total

#       DateTime    :created_at
#       DateTime    :updated_at
#     end
#   end
# end

Sequel.migration do
  change do
    create_table(:store) do
      primary_key :id
      foreign_key :info_id, :info

      String      :place_id
      String      :name
      String      :formatted_address
      String      :location_lat
      String      :location_lng
      String      :plus_code

      #-------Below: GDSC additional message--------------
      String      :compound_code
      String      :global_code
      String      :types
      String      :business_status

      String      :viewport_NE_lat
      String      :viewport_NE_lng
      String      :viewport_SW_lat
      String      :viewport_SW_lng
      #-------Above: GDSC additional message--------------

      Float       :rating
      Integer     :user_ratings_total
      Integer     :price_level

      DateTime    :created_at
      DateTime    :updated_at
    end
  end
end