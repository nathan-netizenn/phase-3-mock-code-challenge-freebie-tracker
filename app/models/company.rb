class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs , through: :freebies
    def freebies
        Freebie.where(company: self)
    end
    def devs
        Dev.joins(:freebies).where(freebies: { company: self })
    end
    
    
    def give_freebie(dev, item_name, value)
        Freebie.create(company: self, dev: dev, item_name: item_name, value: value)
      end
    
      def self.oldest_company
        order(:founding_year).first
      end
    
    end