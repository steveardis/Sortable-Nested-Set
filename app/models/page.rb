class Page < ActiveRecord::Base
  acts_as_nested_set

  scope :nested_set,          order('lft ASC')
  scope :reversed_nested_set, order('lft DESC')

end
