class Operator < ApplicationRecord
  serialize :roles, coder: JSON
end
