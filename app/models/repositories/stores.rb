# frozen_string_literal: true

module CafeMap
    module Repository
      # Repository for Info
      class Stores
        def self.find_id(id)
          rebuild_entity Database::StoreOrm.first(id:)
        end
  
        def self.find_name(name)
          rebuild_entity Database::StoreOrm.first(name:)
        end
        
        def self.find(entity)
          find_name(entity.name)
        end

        def self.create(entity) # check if the data has already in db
          unless find(entity)
            db_store = PersistStore.new(entity).create_store
            puts "here start to create  store"
            rebuild_entity(db_store)
          end
        end

        def self.all_name
          Database::StoreOrm.all.map{|store| store.name}
        end
  
        def self.rebuild_entity(db_record)
            return nil unless db_record
    
            Entity::Store.new(
              place_id: db_record.place_id,
              name: db_record.name,
              formatted_address: db_record.formatted_address,
              location_lat: db_record.location_lat,
              location_lng: db_record.location_lng,
              rating: db_record.rating,
              user_ratings_total: db_record.user_ratings_total
            )
          end
  
        def self.rebuild_many(db_records) 
          # Corresponse to the  "load_several" in mappers/info_mapper.rb
          db_records.map do |db_member|
            Stores.rebuild_entity(db_member)
          end
        end
  
        def self.db_find_or_create(entity)
          Database::StoreOrm.find_or_create(entity.to_attr_hash)
        end
      end
      class PersistStore
        def initialize(entity)
          @entity = entity
        end
  
        def create_store
          Database::StoreOrm.create(@entity.to_attr_hash)
        end
      end
    end
  end
  