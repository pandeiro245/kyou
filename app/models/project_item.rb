class ProjectItem < ApplicationRecord
  belongs_to :project
  belongs_to :item
  attr_accessor :name, :key
end
