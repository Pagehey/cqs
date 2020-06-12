class Member < ApplicationRecord

  def parameterized_name
    name.parameterize
  end
end
