Then(/^I can see the Cross Reference Module$/) do
  PartDetailsPage.new.cross_ref_heading_parent.verify_visible
end

And(/^I can see the '(.*)' icons on the module$/) do|icon_lists|
  icons = icon_lists.split(',')
  icons.each do |icon|
    case icon
      when 'PDF'
        InformationTile.new.pdf_icon.verify_visible
      when 'save'
        InformationTile.new.save_btn.verify_visible
      when 'share'
        InformationTile.new.share_btn.verify_visible
    end
  end
end

And(/^The Buy button for a Cross Ref Product should link to Product Detail Page$/) do
  prod_name = InformationTile.new.title.text.downcase
  man_name = InformationTile.new.manufacturer.text.downcase.gsub(' ', '-').gsub('.','')
  expected_cross_ref_buy_url = "#{$base_url}/products/#{prod_name}/#{man_name}"
  InformationTile.new.module_prod_buy.verify_attribute("href",expected_cross_ref_buy_url)
end
