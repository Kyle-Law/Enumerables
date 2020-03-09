require 'spec_helper'
require './enumerables'

# class Array
#     include Enumerable
# end

# class 
RSpec.describe Enumerable do

    describe '#my_each' do
        
    end
    describe '#my_each_with_index' do
        
    end
    describe '#my_select' do
        
    end
    describe '#my_all?' do
        let(:string_array) {%w[ant bear cat]}
        let(:numeric_array){[1, 2i, 3.14]}
        let(:array_with_nil){[nil, true, 99]}
        
        it 'tests if all elements of string_array fits certain criteria' do
            expect(string_array.my_all?{ |word| word.length >= 3 }).to be_truthy
            expect(string_array.my_all?{ |word| word.length >= 4 }).to be_falsy
            expect(string_array.my_all?(/t/)).to be_falsy
        end

        it 'tests numeric_array' do
            expect(numeric_array.my_all?(Numeric)).to be_truthy
        end

        it 'tests array_with_nil' do
            expect(array_with_nil.my_all?).to be_falsy
        end

        it 'tests empty array' do
            expect([].my_all?).to be_truthy
        end
    end

    describe '#my_any?' do
        
    end
    describe '#my_none?' do
        
    end
    describe '#my_count' do
        
    end
    describe '#my_inject' do
        
    end
    describe '#my_map' do
        
    end
    describe '#multiply_els' do
        subject {multiply_els([1,2,3,4,5])}
        it {is_expected.to eq(120)}
    end
end