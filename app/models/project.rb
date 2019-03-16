class Project < ApplicationRecord
  has_many :project_items
  # has_many :items, through: :project_items

  def items
    project_items.map{|pi| pi.name = pi.item.name; pi.key = pi.item.key; pi}
  end

  def self.init
    project = Project.create!(name: 'KYOU', body: 'check https://ruffnote.com/pandeiro245/kyou')
    {
      github: 'https://github.com/pandeiro245/kyou/projects/1',
      ruffnote: 'https://ruffnote.com/pandeiro245/kyou'
    }.each do |key, val|
      project.add(key, val)
    end
  end

  def add(key, val)
    project_item = project_items.build
    project_item.item = Item.find_by_key(key)
    project_item.value = val
    project_item.save!
  end

  def open(key)
    url = items.select{|item| item.key == key}.first.value
    `open #{url}`
  end

  def open_all
    items.each do |item|
      open(item.key)
    end
  end
end
