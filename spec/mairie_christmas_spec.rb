
require_relative '../lib/mairie_christmas'

describe "the crypto function" do
  it "should return one price for one crytomonnaie" do
    expect(crypto(String)).to eq(true) 
  end
end