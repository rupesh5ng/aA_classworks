require "tdd"
require "rspec"


describe "my_uniq" do

    it " return an array with uniq element" do
        arr = [1,2,1,3,3]
        result = arr.uniq
        expect{ arr.my_uniq}.to eq(result)

    end

    context "when given array is empty or length == 1" do
        it " should return same array" do 
            arr =[]

            expect{ arr.my_uniq}.to be(arr)
        end

    end 
end