describe Item do 
	describe "creation" do
		let(:item_type) { ItemType.create(name: 'Some item type')}
		subject { Item.create(item_type: item_type, name: 'Some item')}
		
		describe "associations" do
			it { should belong_to(:item_type) }
        end

        describe "validations" do
        	it { should validate_presence_of(:name) }
        	it { should validate_presence_of(:item_type) }
        end
       end
      end

