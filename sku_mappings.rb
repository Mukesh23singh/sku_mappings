def mappings(sku_list)
  sku_list_group = sku_list.tally 
  mappings = {
    "CVCD": {"version": 1,"edition": "X"},
    "SDFD": {"version": 2,"edition": "Z"},
    "DDDF": {"version": 1}
  }
  purchased_items = []
  sku_list.uniq.each do |sku|
    purchased_items << mappings[sku.to_sym].merge({quantity: sku_list_group[sku]})
  end
  purchased_items
end

pp mappings(["CVCD", "SDFD", "DDDF", "SDFD"])