module CardHelper
  def prompt_date(event)
    event.start_date.day == event.end_date.day ? one_day_(event) : several_days_(event)
  end

  def beautiful_category(category)
    case category
    when "atelier"   then "Atelier"
    when "evenement" then "Événement"
    when "formation" then "Formation"
    end
  end

  private

  def one_day_(event)
    first_part = l(event.start_date, format: 'Le %A %d %B <br>| %Hh%M')
    last_part  = l(event.end_date, format: '%Hh%M')

    raw "#{first_part} - #{last_part}"
  end

  def several_days_(event)
    first_part = l(event.start_date, format: 'Du %A %d %B')
    last_part  = l(event.end_date, format: 'Au %A %d %B')

    raw first_part + '<br>' + last_part
  end
end
