class Book < ApplicationRecord
  has_one_attached :file
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 150]
  end

  belongs_to :user
  validates :name, presence: true
  validates :cover, attached: true, processable_image: true, size: { less_than: 20.megabytes , message: 'is too large' }
  validates :file, attached: true, content_type: [:epub, :fb2, :mobi, :azw, :txt], size: { less_than: 50.megabytes , message: 'is too large' }

  def self.ransackable_attributes(auth_object = nil)
    new.attribute_names
  end

  def self.ransackable_associations(auth_object = nil)
    [:users]
  end
end
