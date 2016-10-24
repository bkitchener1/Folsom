def convert_to_sitecore_url_format(url_param)
  #Converts stirng:
  # 1. To lower case
  # 2. or all non a-z, 0-9 and existing hypens, replace with hypen
  # 3. replaces --- with -
  # 4. replaces -- with -
  url_param.downcase.gsub("'", '').gsub(/[^a-z0-9.-_]/i, '-').gsub('/', '').gsub('.', '').gsub('---', '-').gsub('--', '-')
end
