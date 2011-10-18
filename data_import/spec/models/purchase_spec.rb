require 'spec_helper'

describe Purchase do
  it { should belong_to :item }
  it { should belong_to :customer }

  it { should validate_presence_of :count }
end
