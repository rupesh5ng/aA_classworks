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
describe Array do
    describe "#two_sum" do
        subject(:array) {[-1 ,0, 2, -2, 1]}
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
end

describe "my_transpose" do
    subject(:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
            ]}
    subject(:cols) { [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]}

    it "transposes rows to column" do 
        expect(my_transpose(rows)).to eq(cols)
    end


end

describe 'stock_picker' do
    subject(:stock_prices) {[5, 7, 4, 9, 7, 5, 7, 2, 1, 8, 3]}
    it 'gives the most profitable pair of days' do 
        expect(stock_picker(stock_prices)).to eq([8, 9])
    end
end


# describe TowerOfHanoi do
#     describe '#initialize' do 
#         it "initializes towers with 3 arrays" do
#             expect(TowerOfHanoi.size) to be 3" do

#             end
#         end
#     end
#     subject(:tower) {|}
# end


# initialize(n = 3)
# @win_condition = [*1..n]
# (1..n) => first array
# second array empty
# 3rd array empty
# [1, 2, ..n]
# []
# []

# move(first_arr, second_arr)

#     moves a piece from first to second
# end

# won?
# if second or 3rd array = win_condition
#     true
# else
#     false
# end
# end

# def run

#     until won?
#         move
#     end
# end



# towers = [[*1..n][][]]
# win? method
# move method
#     move only onto larger disk from NON empty stack
#     - valid_move?
# render method

describe "move" do

end

describe "valid_move?" do

end



tower_of_hanoi(6)