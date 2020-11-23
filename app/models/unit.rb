class Unit < ApplicationRecord
  belongs_to :subject
  belongs_to :parent_unit, class_name: 'Unit', optional: true
end
