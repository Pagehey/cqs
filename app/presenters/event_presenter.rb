class EventPresenter < BasePresenter
  include_view_helpers

  def places_left
    return 'Pas de limites de place' unless __getobj__.number_of_places

    places_left = __getobj__.number_of_places - __getobj__.participations.count

    plural = h.pluralize places_left, 'place disponible', 'places disponibles'

    "#{plural} sur #{__getobj__.number_of_places}"
  end
end
