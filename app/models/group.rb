class Group < ActiveRecord::Base
  belongs_to :test
  has_many :questions,
    -> { order('id asc') }

  def self.get_next_group(group_id)
    return nil if group_id == nil
    g = Group.find(group_id)
    Group.where(test_id: g.test.id).where('id > ?', g).order('id asc').first
  end
end
