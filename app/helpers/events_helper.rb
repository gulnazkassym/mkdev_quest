module EventsHelper
  def date_formatter(date)
    date.strftime('%a, %d %b %Y %H:%M')
  end

  def simple_form_i18n(element, name)
    t("simple_form.#{element}.event.#{name}")
  end
end
