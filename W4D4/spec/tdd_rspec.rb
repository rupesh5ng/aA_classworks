require "tdd"
require "rspec"


describe "my_uniq" do

    it " return an array with uniq element" do
        arr = [1,2,1,3,3]
        result = arr.uniq
        expect(my_uniq(arr)).to eq(result)

    end

    context "when given array is empty or length == 1" do
        it " should return same array" do 
            arr =[]

            expect(my_uniq(arr)).to be(arr)
        end

    end 
end

describe "#two_sum" do
    subject(:array) {%w(-1 0 2 -2 1)}
    # context "When array is empty or array length is less than 2" do
    #     arr2 = []
    #     it "returns nil if array is empty" do
    #         expect(arr2.empty?).to raise_error("Array doesn't have elements")
    #     end
    #     it "returns "
    # end

    context "When there are matching pairs" do
        it "returns index pairs that add to 0" do
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    context "When there are no matching pairs" do
        it "returns nil if no match is found" do
            expect([].two_sum).to eq(nil)
        end 
    end
end