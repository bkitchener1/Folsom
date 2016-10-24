class String
  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split(' ').map{|e| e.capitalize!}.join(' ')
  end
  def to_currency
    number = self.split('.')
    number[0] = number[0].reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
    number.join('.')
  end
  def is_truthy
    return self.downcase == "true"
  end
end

