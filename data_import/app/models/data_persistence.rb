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
    Merchant.for_data(merchant_data)
  end

  def build_item(merchant, item_data)
    merchant.items.for_data(item_data)
  end

  def build_customer(customer)
    Customer.for_data(customer)
  end

end
