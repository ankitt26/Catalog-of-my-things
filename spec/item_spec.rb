require_relative '../item'

describe Item do

  describe '#can_be_archived?' do
     context "Given publish_date later than 2013" do
       it "Should return false" do
         item1 = Item.new('2018-8-8')
         expect(item1.can_be_archived?).to be false
       end
     end

     context "Given publish_date earlier than 2013" do
       it "Should return true" do
         item1 = Item.new('2011-8-8')
         expect(item1.can_be_archived?).to be true
       end
     end
   end

   describe '#move_to_archive' do
     context "Given publish_date later than 2013" do
       it "Should return false" do
         item1 = Item.new('2018-8-8')
         expect(item1.move_to_archive).to be false
       end
     end

     context "Given publish_date earlier than 2013" do
       it "Should return true" do
         item1 = Item.new('2011-8-8')
         expect(item1.move_to_archive).to be true
       end
     end
   end
 end