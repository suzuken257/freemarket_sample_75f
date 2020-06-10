require 'rails_helper'

RSpec.describe ItemImage, type: :model,do: true  do
  let(:item_image_path) { Rails.root.join('spec/factories/test.jpg') }
  let(:item_image) { Rack::Test::UploadedFile.new(item_image_path) }
  let(:user) {create(:user)} 
  let(:category) { create(:category) } 
  
  it "画像があれば有効" do
    item = build(:item)
    item.valid?
    expect(item).to be_valid
  end

end