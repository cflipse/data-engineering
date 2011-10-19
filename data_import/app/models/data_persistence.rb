class DataPersistence
  attr_reader :purchases
  def initialize(purchases)
    @purchases = purchases
  end


  def save
    Purchase.connection.transaction do
      purchases.each do |purchase|
        create_purchases(purchase).save!
      end
    end
    return true
  rescue 
    return false
  end

  private

  def create_purchases(attrs)
    merchant = build_merchant(attrs.merchant)
    item = build_item(merchant, attrs.item)
    customer = build_customer(attrs.customer) 
    

    Purchase.create!(:count => attrs.count, :item => item, :customer => customer)
  end

  def build_merchant(merchant_data)
    Merchant.find_or_create_by_name_and_address(merchant_data.name, merchant_data.address)
  end

  def build_item(merchant, item_data)
    merchant.items.find_or_create_by_description_and_price_in_cents(item_data.description, item_data.price * 100)
  end

  def build_customer(customer)
    Customer.find_or_create_by_name(customer.name)
  end

end
