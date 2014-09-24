require 'rails_helper'

describe Post do
  it { should validate_presence_of :post }
  it { should validate_presence_of :user_id }

  it { should belong_to :user }
end
