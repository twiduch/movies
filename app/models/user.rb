class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :movies, -> { distinct }, through: :groups
  belongs_to :active_group, class_name: 'Group'

  before_validation -> { build_active_group(name: 'Initial', user: self) }, on: :create
end
