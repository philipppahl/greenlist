require 'spec_helper'

describe "Items" do

  subject { page }

  describe "Index" do
  	# There is a cleaner way to do the following two lines, surely.
  	let(:item) { FactoryGirl.create(:item) }
  	before do
  		visit item_path(item)
  		visit items_path
  	end
    
    describe "Shows item name" do
      it { should have_content item.name }
    end

    describe "Item shows correct status" do
      it { should have_selector("td.item_name.#{item.status}") }

      it { should have_content 'Unknown'}
      it { should_not have_content 'Enough'}
    end

  end
end
