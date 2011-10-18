require 'spec_helper'

describe Item do
  it { should validate_presence_of :description }
  it { should validate_presence_of :price_in_cents }
end
