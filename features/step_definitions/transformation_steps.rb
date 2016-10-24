Transform /^(\d+)$/ do |number|
  # only transform when the param does NOT start with 0. Else leave as string
  if number[0] != '0'
    number.to_i
  else
    number
  end
end

Transform /^(true)/ do |state|
  state = true
  state
end

Transform /^(false)/ do |state|
  state = false
  state
end