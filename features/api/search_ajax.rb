class SearchAjax < BaseApi
  def initialize
    @page = 1
    @max_pages = 20
  end

  def search_bav99
    search_for "bav99"
  end

  def search_for(item_id)
    @item_id = item_id
    @search_uri = "#{FigNewton.base_url}/en/products/search?q=#{item_id}"
    get_uri @search_uri
    @uri = "#{FigNewton.base_url}/productsearch/searchresultsajax?page=1&q=#{item_id}"
    execute_api_request
  end


  def get_next_page
    if @page > @max_pages
      raise "Could not find item in the api after #{@max_pages} pages"
    end
    @page = @page +=1
    @uri = "#{FigNewton.base_url}/productsearch/searchresultsajax?page=#{@page}&q=#{@item_id}"
    execute_api_request
  end

  def get_discontinued_items
    @max_pages = 20
    response = @json
    @items = response["data"]["results"].select{|item|
      item['isDiscontinued'] == true
    }
    if @items.count == 0
      get_next_page
      get_discontinued_items
    end

    @items
  end

  def get_item_with_datasheet
    response = @json
    @items = response["data"]["results"].select{|item|
      not item['datasheetUrl'] == '' and item['isDiscontinued'] == false
    }
    if @items.count == 0
      get_next_page
      get_item_with_datasheet
    end
    @items
  end

  def get_item_with_no_datasheet
    response = @json
    @items = response["data"]["results"].select{|item|
      item['datasheetUrl'] == ''
    }
    if @items.count == 0
      get_next_page
      get_item_with_no_datasheet
    end
    @items
  end

  def get_items_with_type(type)
    response = @json
    @items = []
    response["data"]["results"].each{|item|
      if item['isDiscontinued'] == false
        options = item["buyingOptions"]
       if options.length >= 1
          if options[0]["type"] == type
            @items.push(item)
          end
       end
      end
    }
    if @items.count == 0
      get_next_page
      get_items_with_type type
    end
    @items
  end

  def get_ecliptek_items
    response = @json
    @items = []
    response["data"]["results"].each{|item|
      if item['isDiscontinued'] == false
        options = item["buyingOptions"]
        if options.length == 1
          if options[0]["type"] == 'Ecliptek'
            @items.push(item)
          end
        end
      end
    }
    if @items.count == 0
      get_next_page
      get_ecliptek_items
    end
    @items
  end

  def get_backordered_items()
    get_items_with_type 'Backorder'
  end

  def get_in_stock_items()
    get_items_with_type 'AddToCart'
  end

  def get_quote_items()
    response = @json
    @items = []
    response["data"]["results"].each{|item|
      if item['primaryBuyingOptionType'] == "Quote"
        @items.push item
      elsif item["buyingOptions"].select {|x|x['type']=="Quote"}.count > 0
        @items.push item
      end
    }
    if @items.count == 0
      get_next_page
      get_quote_items
    end
    @items

  end


  def get_pipeline_items
    response = @json
    @items = []
    response["data"]["results"].each{
        |item|
      options = item["buyingOptions"]
      if options.count == 1
        options.each{ |option|
          if option['pipelines'].count > 0
            @items.push(item)
          end
        }
      end
    }
    if @items.count == 0
      get_next_page
      get_pipeline_items
    end
    @items
  end
end