require 'delegate'

class BasePresenter < SimpleDelegator
  def self.wrap(models)
    models.map { |model| new(model) }
  end

  def self.include_view_helpers
    define_method :h do
      ActionController::Base.helpers
    end
  end
end
