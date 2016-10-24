# created this page object, it was missing and the script for sanity to verify sitemap page was failing

class SitemapPage < ContentPage

  # added below urls

 @sitemap_page_url ='sitemap.xml?custip=157.55.33.18'
  @page_url = "#{FigNewton.base_url}/#{sitemap_page_url}"

  # added method for COP-160

  def verify_sitemap_pages
    sitemap_page_url ='sitemap.xml?custip=157.55.33.18'
    $driver.get("#{FigNewton.base_url}/#{sitemap_page_url}")
    HomePage.new.verify_page_integrity
  end

  # added method for COP-160
  def verify_sitemap_video_page
    sitemap_video_url ='sitemaps/video_sitemap.xml?custip=157.55.33.18'
    $driver.get("#{FigNewton.base_url}/#{sitemap_video_url}")
    HomePage.new.verify_page_integrity
  end

  # add
  def visit_site_map_page
    $driver.get("#{FigNewton.base_url}/#{sitemap_page_url}")
  end

 # add for product site map

  def verify_sitemap_product_page
    sitemap_product_url ='sitemaps/product_sitemap.xml?custip=157.55.33.18'
    $driver.get("#{FigNewton.base_url}/#{sitemap_product_url}")
    HomePage.new.verify_page_integrity
  end


  # add for verifying search in sitemap

  def verify_cairo_sitemap_search
    $driver.get("#{FigNewton.cairo_sitemap_search_page_url}")
    HomePage.new.verify_page_integrity
  end

end