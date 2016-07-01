require "spec_helper"

describe "Middleware", type: :request do
  let(:user) { User.create(first_name: "first", last_name: "last") }

  it "run middleware" do
    get "/saved"
    expect(response).not_to be nil
  end

  it "raise an exception" do
    get '/dirty'
    expect(response).not_to be nil
  end
end
