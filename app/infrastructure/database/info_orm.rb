# frozen_string_literal: true

require 'sequel'
require './config/environment'

module CafeMap
  module Database
    # Object Relational Mapper for Project Entities
    class InfoOrm < Sequel::Model(:info)
      one_to_one :stroereview, class: :'CafeMap::Database::StoreOrm'
      plugin :timestamps, update_on_create: true

      def self.find_or_create(store_info)
        first(name: store_info[:name]) || create(store_info)
      end
    end
  end
end
