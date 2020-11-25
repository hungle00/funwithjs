require "spec_helper"
require "./app.rb"

def app
  MyApp
end

RSpec.describe 'The HelloWorld App' do

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.status).to eq(200)
  end
end