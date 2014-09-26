require 'rails_helper'

describe Follow do
  it { should validate_presence_of :user_id }
end
