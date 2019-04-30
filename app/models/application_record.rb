class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_slug(string)
    string = string.parameterize.truncate(80, omission: '')
    string.to_s
  end
end
