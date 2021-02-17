module EventsHelper

  def event_icon(event)
    if event.call.present?
      "fa fa-phone"
    elsif event.agreement.present?
      "fa fa-file-text"
    elsif event.reminder.present?
      "fa fa-tasks"
    else
      "fa fa-address-card"
    end
  end

  def event_color(event)
    if event.call.present?
      "yellow-bg"
    elsif event.agreement.present?
      "blue-bg"
    elsif event.reminder.present?
      "lazur-bg"
    else
      "navy-bg"
    end
  end

  def event_link(event)
    if event.call.present?
      link_to("Pokaż więcej", event.call, class: "btn btn-sm btn-primary")
    elsif event.agreement.present?
      link_to("Pokaż więcej", event.agreement, class: "btn btn-sm btn-primary")
    elsif event.reminder.present?
      link_to("Pokaż więcej", event.reminder, class: "btn btn-sm btn-primary")
    else
      link_to("Pokaż więcej", event.client, class: "btn btn-sm btn-primary")
    end
  end

end
