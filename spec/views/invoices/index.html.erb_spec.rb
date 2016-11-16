require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :amount => "9.99",
        :currency => "Currency",
        :reference => ""
      ),
      Invoice.create!(
        :amount => "9.99",
        :currency => "Currency",
        :reference => ""
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
