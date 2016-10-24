require_relative '../../support/page_object'

class ExistingAddress < PageObject
    @edit = WebElement.new("a.glyphicon-pencil")
    @trash = WebElement.new(".glyphicon-trash")
    @name = WebElement.new("article>div:nth-child(3)")
    @company = WebElement.new("article>div:nth-child(4)")
    @phone = WebElement.new("article>div:nth-child(5)")
    @address = WebElement.new("article>div:nth-child(6)")
    @address2 = WebElement.new("article>div:nth-child(7)")
    @state = WebElement.new("article>div:nth-child(8)")
    @country = WebElement.new("article>div:nth-child(9)")
    @reseller_cert = WebElement.new("article>div:nth-child(10)")
    @vat_id = WebElement.new("article>div:nth-child(11)")
end