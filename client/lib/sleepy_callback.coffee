@sleepyCallback = (callback, snoozeInterval=100) ->
  snoozing = stale = false

  wakeAndCheck = ->
    if stale
      stale = false
      callAndSnooze()
    else
      snoozing = false

  callAndSnooze = ->
    callback()
    snoozing = true
    Meteor.setTimeout wakeAndCheck, snoozeInterval

  ->
    if snoozing
      stale = true
    else
      callAndSnooze()

