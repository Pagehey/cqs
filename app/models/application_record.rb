class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_slug(id, string)
    string = string.parameterize.truncate(80, omission: '')
    "#{id}-#{string}"
  end
end
