class AddAddress < PageObject
    attr_accessor :certificate_upload, :zip
    @order_summary = CartOrderSummary.new(".cartSummary")
    @cart_header = CartHeader.new(".cartSummary")
    @name = WebElement.new("#name")
    @company = WebElement.new("input[ng-model*=company]")
    @phone = WebElement.new("#phone1")
    @country = WebElement.new("#country")
    @address = WebElement.new("#street1")
    @address2 = WebElement.new("#street2")
    @city = WebElement.new("#city")
    @state = WebElement.new("#state")
    @zip = WebElement.new("#postalCode")
    @email= WebElement.new("#email")
    @cr_code = WebElement.new("#crcode")
    @vat_id = WebElement.new("#vat")
    @certificate_upload = WebElement.new("#filestyle-0")
    @reseller_certificate_message = WebElement.new("div[ng-show*=hasValidResellerCertificate]")
    @close = WebElement.new("button[ng-click*=close]")
    @update = WebElement.new("button[ng-click*=ok]")
    @error_message = WebElement.new(".form-error")
    @state_label = WebElement.new("label[for=state]")
    @backdrop = WebElement.new(".modal-backdrop")

    # shipping address form error for P.O. box
    @form_error = WebElement.new(".form-error")

    def po_box_error
      @form_error.attribute('Unfortunately, we do not ship to PO Boxes. Please enter a different address.')
    end

    # freight forward shipping address
    @ultimate_destination = WebElement.new(".grid-title")

    def ultimate_destination_text
      @ultimate_destination.attribute('SELECT ULTIMATE DESTINATION')
    end

    @ult_dest_message = WebElement.new(".checkoutSectionBody")

    def international_trade_compliance_message
      @ult_dest_message.attribute('You selected a Freight Forwarder shipping address.
      In order to satisfy international trade compliance, you must enter a valid address for the ultimate destination.')
    end

    # shipping address type locator
    @address_type =  WebElement.new("#type")

    # billing address, add new address form level error locators

    @error_message_billing_address = WebElement.new("li[ng-show='vm.addressForm.$error']")
    @error_message_billing_address_type = WebElement.new("li[ng-show='vm.addressForm.type.$error.required']")
    @error_message_billing_address_name = WebElement.new("li[ng-show='vm.addressForm.name.$error.required']")
    @error_message_billing_address_postalcode = WebElement.new("li[ng-show='vm.addressForm.postalCode.$error.required']")
    @error_message_billing_address_address = WebElement.new("li[ng-show='vm.addressForm.street1.$error.required']")
    @error_message_billing_address_city = WebElement.new("li[ng-show='vm.addressForm.city.$error.required']")
    @error_message_billing_address_phone = WebElement.new("li[ng-show='vm.addressForm.phone1.$error.required']")

    # form level error locator for cr_code
    @error_message_billing_address_cr_code = WebElement.new("li[ng-show='vm.addressForm.crcode.$error.required']")

    # form level error locator for vat_id
    @error_message_billing_address_vat_id = WebElement.new("li[ng-show='vm.addressForm.vatid.$error.required']")

    def add_address(address_type,name, company, phone, country, address, address2, city, state, zip, email, cr_code=NIL, vat_id=NIL, reseller_cert=NIL)
      @address_type.select_by(:value, address_type.to_i)
      #@address_type.set_text(address_type)
      @name.set_text(name)
      @company.set_text(company)
      @phone.set_text(phone)
      @country.select_by(:text, country)
      @address.set_text(address)
      @address2.set_text(address2)
      @city.set_text(city)
      if country == "United States of America"
        @state.select_by(:text, state)
      else
        @state.set_text(state)
      end
      @zip.set_text(zip)
      @email.set_text(email)
      if(@cr_code.displayed?)
        @cr_code.set_text(cr_code)
      end
      if(@vat_id.displayed?)
        @vat_id.set_text(vat_id)
      end
      if reseller_cert != NIL
        upload_reseller_cert(reseller_cert)
      end
      @update.click
      @backdrop.verify_not_visible
    end

  def upload_reseller_cert(file_path)
    @certificate_upload.send_keys(file_path)
  end

  def verify_error_message_for_field(field_name)
    # form level error message
      @error_message.verify_visible
      #@error_message.verify_text "#{field_name}is required"
      @error_message.verify_text 'Address type is required
Name is required.
Postal Code is required.
Address is required.
City is required.
Phone is required.'
      # WebElement.new("li[ng-show*=#{field_name}]").verify_visible
     # WebElement.new("label[for=#{field_name}].error").verify_visible
  end


    # for adding billing address, form level error locators, field level errors was not implemented

    def verify_error_message_for_form_billing_address
    # form level error message
  # WebElement.new("li[ng-show*=#{field_name}]").verify_visible
  # WebElement.new("label[for=#{field_name}].error").verify_visible
    @error_message_billing_address.verify_visible
    @error_message_billing_address_type.verify_text "Address type is required"
    @error_message_billing_address_name.verify_text "Name is required."
    @error_message_billing_address_postalcode.verify_text "Postal Code is required."
    @error_message_billing_address_address.verify_text "Address is required."
    @error_message_billing_address_city.verify_text "City is required."
    @error_message_billing_address_phone.verify_text "Phone is required."

    end

    # code for form level error message for cr code

    def verify_error_message_cr_code
      # form level error message
      @error_message_billing_address_cr_code.verify_text "CR Code is required."
    end

    # code for no form level error message for postal code optional

    def verify_error_message_postal_code_optional
      # form level error message
      @error_message_billing_address_postalcode.verify_not_visible
    end

    def verify_error_message_postal_code_required
      # form level error message
      @error_message_billing_address_postalcode.verify_text "Postal Code is required."
    end

    # code for no form level error message for vat id optional

    def verify_error_message_vat_id_optional
      # form level error message
      @error_message_billing_address_vat_id.verify_not_visible
    end


  def verify_state_field(type=:text)
    state_type = @state.attribute("type")
    tag = @state.tag_name
    if type == :text
      if tag != "input"
        raise "State should be a text field"
      end
    elsif type == :dropdown
       if tag != "select"
         raise "State should be a dropdown"
       end
    else
      raise "Only supports :text and :dropdown"
    end

  end

    def verify_state_label(value)
      eles = @state_label.verify_text(value)
    end

  def verify_field(fieldName, fieldvalue)
    element = self.send(fieldName)
    if fieldName == "country"
      if element.as_select.first_selected_option.text != fieldvalue
        raise "Field #{fieldName} should have value #{fieldvalue} not #{element.as_select.first_selected_option.text}"
      end
    elsif not element.value.to_s.include? fieldvalue.to_s
      raise "Field #{fieldName} should have value #{fieldvalue} not #{element.value}"
    end
  end

  def verify_country_group(name)
    common  = WebElement.new("optgroup[label='Common Countries']",@country)
    common.verify_present
  end

  def verify_country_sorted
      opt_groups  = @country.find_elements(:css,"optgroup")
      for opt in opt_groups
          all_options = opt.find_elements(:css,"option")
          all_values = []
          for option in all_options
              all_values << option.text
          end
          if not self.ascending? all_values
              raise "Common Countries not in ascending order"
          end
      end

  end

    def ascending? arr
        arr == arr.sort
    end

    def select_country(arg)
        @country.select_by(:text,arg)
    end

    def verify_no_error_message_for_field(field_name)
      # form level error message, scripts incorrect validating field level error
      @error_message.verify_not_visible
      #WebElement.new("li[ng-show*=#{field_name}]").verify_not_visible
      #WebElement.new("label[for=#{field_name}].error").verify_not_visible
    end

    def verify_state_dropdown(arg)
      if @state.as_select.first_selected_option.text != arg
        raise "State dropdown should have #{arg} selected but had #{@state.select.first_selected_option}"
      end
    end

    # address_type new field on shipping address

    def select_address_type_direct_consumer(shipping_type)
      @address_type.click
      @address_type.select_by(:value, shipping_type)

    end


    def select_address_type(shipping_type)
      @address_type.as_select.options[shipping_type.to_i].click
     address_type_selected = @address_type.as_select.options[shipping_type.to_i].text
    end
end