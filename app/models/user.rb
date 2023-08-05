class User < ApplicationRecord

  validates :uid, presence: true, uniqueness: true

  has_many :books, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    new.attribute_names
  end

  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end


end
