class Product
  include Mongoid::Document
  include Mongoid::Search
  field :brand
  field :name
  field :displayed, :type => Boolean, :default => true

  references_many :tags
  referenced_in   :category
  embeds_many     :subproducts

  search_in :brand, :name, :tags => :name, :category => :name, :subproducts => [:brand, :name]
end

