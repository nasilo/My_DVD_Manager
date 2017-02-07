require "rails_helper"

RSpec.describe Api::V1::DvdsController, type: :controller do
  describe "POST #upc", vcr: true do
    let!(:grease) {
      Upc.create(upc: "097361557441")
    }

    let!(:casablanca) {
      Upc.create(upc: "012569500822")
    }

    it "should create a UPC" do
      post :upc, params: { upc: "086162162688" }
      upcs = Upc.all.map { |upc| upc.id }

      expect(upcs.length).to eq(3)
    end
  end

  describe "POST #create", vcr: true do
    let!(:dvd1) { FactoryGirl.create(:dvd) }
    let!(:dvd2) { FactoryGirl.create(:dvd) }
    let!(:casablanca) {
      Upc.create(upc: "012569500822")
    }

    it "should create a dvd" do
      post :create, params: {
        dvd: {
          title: "Casablanca", upc_id: casablanca.id
        }
      }
      upcs = Upc.all.map { |upc| upc.id }

      expect(upcs.length).to eq(3)
    end
  end
end
