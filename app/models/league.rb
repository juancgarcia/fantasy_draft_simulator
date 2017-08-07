class League < ApplicationRecord
  has_many :teams, :dependent => :destroy
  accepts_nested_attributes_for :teams
end
