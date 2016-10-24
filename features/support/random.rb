def random_string(length=8)
  [*('a'..'z')].sample(length).join
end
