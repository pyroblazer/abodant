class Property < ApplicationRecord
  belongs_to :company

  validates :address, :owner, :price, :size, presence: true

  enum basement: { no: 0, yes: 1 }
  enum style: { townhouse: 0, apartment: 1 }
  enum floors: { "1" => 0, "2" => 1, "3" => 2, "4" => 3, "5+" => 4 }

  # If you're using ActiveStorage, uncomment the following line:
  # has_many_attached :images

  # If you are still using CarrierWave, it's better to use the `image` as a separate uploader.
  # Ensure that you have the correct uploader class (ImageUploader) set up with CarrierWave.
  mount_uploader :image, ImageUploader

  # `serialize` is used for older versions of Rails to store Ruby objects in text columns. 
  # For CarrierWave, you typically don't need this, as CarrierWave handles serialization.
  # The following line is likely unnecessary and can be removed:
  # serialize :image, JSON
end
