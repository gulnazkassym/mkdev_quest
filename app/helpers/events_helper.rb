module EventsHelper
  def date_formatter(date)
    date.strftime('%a, %d %b %Y %H:%M')
  end
end
