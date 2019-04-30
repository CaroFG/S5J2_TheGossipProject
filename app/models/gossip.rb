class Gossip < ApplicationRecord
	belongs_to :user
	has_many :join_tag_to_gossips
	has_many :tags, through: :join_tag_to_gossips
end
