module Reservable
    extend ActiveSupport::Concern

    def openings(start_date, end_date)
        listings.merge(Listing.available(start_date, end_date))
      end
    
      def ratio_res_to_listings
        if listings.count > 0
          reservations.count.to_f / listings.count.to_f
        end
      end
    
      class_methods do
        
        def highest_ratio_res_to_listings
          all.max do |a, b|
            a.ratio_res_to_listings <=> b.ratio_res_to_listings
          end
          binding.pry
        end
    
        def most_res
          all.max do |a, b|
            # binding.pry
            a.reservations.length <=> b.reservations.length
          end
        end
      end
    end