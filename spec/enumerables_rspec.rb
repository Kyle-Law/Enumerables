require 'spec_helper'
require './enumerables'

# class Array
#     include Enumerable
# end

# class
RSpec.describe Enumerable do
  describe '#my_each' do
    let(:empty_array) { [] }

    it 'checks if it returns Enumerator when no block is given' do
      expect(empty_array.my_each.class).to eql(Enumerator)
    end

    it 'checks if elements are pushed inside the empty array' do
      %w[cat dog wombat].my_each { |element| empty_array << element }
      expect(empty_array).to eql(%w[cat dog wombat])
    end
  end

  describe '#my_each_with_index' do
    let(:empty_array) { [] }

    it 'checks if it returns Enumerator when no block is given' do
      expect(empty_array.my_each_with_index.class).to eql(Enumerator)
    end

    it 'check if elements are pushed into the array with respective index' do
      %w[cat dog wombat].my_each_with_index { |item, index| empty_array[index] = item }
      expect(empty_array).to eql(%w[cat dog wombat])
    end
  end

  describe '#my_select' do
    it 'checks if it returns Enumerator when no block is given' do
      expect([].my_select.class).to eql(Enumerator)
    end

    it 'tests when my_select is invoked by a Range' do
      expect((1..10).find_all { |i| i % 3 == 0 }).to eql([3, 6, 9])
    end

    it 'tests when my_select is invoked by an Array' do
      expect([1, 2, 3, 4, 5].my_select { |num| num % 4 == 0 }).to eql([4])
    end

    it 'tests when my_select is invoked by an Array of symbol' do
      expect(%i[foo bar].my_select { |x| x == :foo }).to eql([:foo])
    end
  end

  describe '#my_all?' do
    let(:string_array) { %w[ant bear cat] }
    let(:numeric_array) { [1, 2i, 3.14] }
    let(:array_with_nil) { [nil, true, 99] }

    it 'tests if all elements of string_array fits certain criteria' do
      expect(string_array.my_all? { |word| word.length >= 3 }).to be_truthy
      expect(string_array.my_all? { |word| word.length >= 4 }).to be_falsy
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
    let(:string_array) { %w[ant bear cat] }
    let(:numeric_array) { [1, 2i, 3.14] }
    let(:array_with_nil) { [nil, true, 99] }

    it 'tests if any elements of string_array fits certain criteria' do
      expect(string_array.my_any? { |word| word.length >= 3 }).to be_truthy
      expect(string_array.my_any? { |word| word.length >= 4 }).to be_truthy
      expect(string_array.my_any?(/d/)).to be_falsy
    end

    it 'tests numeric_array' do
      expect(numeric_array.my_any?(Numeric)).to be_truthy
    end

    it 'tests array_with_nil' do
      expect(array_with_nil.my_any?).to be_truthy
    end

    it 'tests empty array' do
      expect([].my_any?).to be_falsy
    end
  end

  describe '#my_none?' do
    subject { %w[ant bear cat] }

    it 'tests if Block is given' do
      expect(subject.my_none?(/d/)).to be_truthy
    end

    it 'tests if Regex is given as parameter' do
      expect(subject.my_none?(/d/)).to be_truthy
    end

    it 'check when Class is given as parameter' do
      expect([1, 3.14, 42].my_none?(Float)).to be_falsy
    end

    it 'tests when no parameter is given' do
      expect([].my_none?).to be_truthy
      expect([nil].my_none?).to be_truthy
      expect([nil, false].my_none?).to be_truthy
      expect([nil, false, true].my_none?).to be_falsy
    end
  end

  describe '#my_count' do
    subject { [1, 2, 4, 2] }

    it 'check when no parameter is given' do
      expect(subject.my_count).to eql(4)
    end

    it 'check when a parameter is given' do
      expect(subject.my_count(2)).to eql(2)
    end

    it 'check when a block is given' do
      expect(subject.my_count { |x| x % 3 == 0 }).to eql(0)
    end
  end

  describe '#my_inject' do
    subject { (5..10) }

    it 'check when a Symbol is given' do
      expect(subject.my_inject(:+)).to eql(45)
    end

    it 'check when a block is given' do
      expect(subject.my_inject { |sum, n| sum + n }).to eql(45)
    end

    it 'check when two parameters are given' do
      expect(subject.my_inject(1, :*)).to eql(151_200)
    end

    it 'check when a parameter and a block are given' do
      expect(subject.my_inject(1) { |product, n| product * n }).to eql(151_200)
    end
  end

  describe '#my_map' do
    subject { (1..4) }

    it 'checks if it returns Enumerator when no block is given' do
      expect([].my_map.class).to eql(Enumerator)
    end

    it 'check if an array is returned' do
      expect(subject.my_map { |i| i * i }).to eql([1, 4, 9, 16])
    end
  end
  describe '#multiply_els' do
    subject { multiply_els([1, 2, 3, 4, 5]) }
    it { is_expected.to eq(120) }
  end
end
