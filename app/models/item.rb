class Item < ApplicationRecord
  def self.init
    [
      %w(Cloud9 cloud9),
      %w(GitHub github),
      %w(TimeCrowd timecrowd),
      %w(Ruffnote ruffnote),
      %w(GoogleSpreadsheet ss),
    ].each do |item_names|
      Item.create!(name: item_names[0], key: item_names[1])
    end
  end
end
