global "day" {
  value = "monday"
}

global "hour" {
  value = 7
}

test {
  rules = {
    main          = false
    is_open_hours = false
  }
}