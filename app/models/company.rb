class Company < ApplicationRecord
  has_many :users
  has_many :properties, dependent: :destroy

  validates :name, :address, :website, presence: true
  validates :year_founded, length: { is: 4, message: 'Year must be in YYYY' }
  validates :website, url: { message: 'must be a valid URL' }

  enum size: { "0-50" => 0, "51-200" => 1, "201-500" => 2, "501-1000" => 3, "1000+" => 4 }
  enum revenue: { "Below 1 Million" => 0, "1 to 10 Million" => 1, "10 to 100 Million" => 2, "More than 100 Million" => 3 }
end
