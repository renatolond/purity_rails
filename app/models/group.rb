class Group < ActiveRecord::Base
  belongs_to :test
  has_many :questions,
    -> { order('id asc') }
end
