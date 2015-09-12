window.EventsIndexView = ->
  $ ->
    if $(".events").length > 0
      setTimeout updateEvents, 5000

  updateEvents = ->
    teamId = $(".events").data("team-id")
    if $(".events").length > 0
      after = $(".event:last-child").data('time')
    else
      after = "0"
    $.getScript "/teams/#{teamId}/events.js?after=#{after}"
    setTimeout updateEvents, 5000
