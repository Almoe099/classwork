require 'rspec'
require "tdd_project"

describe Array do
    describe '#uniq' do
      context 'when array contains duplicates' do
        it 'removes duplicates and keeps original order' do
          expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
        end
      end
  
      context 'when array has no duplicates' do
        it 'returns the array as is' do
          expect([1, 2, 3].uniq).to eq([1, 2, 3])
        end
      end
  
      context 'when array is empty' do
        it 'returns an empty array' do
          expect([].uniq).to eq([])
        end
      end
  
      context 'when array contains nil values' do
        it 'treats nil as a unique element' do
          expect([nil, nil, 1, 2].uniq).to eq([nil, 1, 2])
        end
      end
  
      context 'when array contains complex objects' do
        it 'compares objects for uniqueness' do
          obj1 = Object.new
          obj2 = Object.new
          expect([obj1, obj2, obj1].uniq).to eq([obj1, obj2])
        end
      end
    end

    describe '#two_sum' do
      context 'when no pairs sum to zero' do
        it 'returns an empty array' do
          expect([1, 2, 3].two_sum).to eq([])
        end
      end

      context 'when pairs sum to zero' do
        it 'returns all pairs with smaller indices first' do
          expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
      end
  
      context 'when array contains zero' do
        it 'handles zero correctly' do
          expect([-1, 0, 1, 2].two_sum).to eq([[0, 2]])
        end
      end
  
      context 'when array is empty' do 
        it 'returns an empty array' do
          expect([].two_sum).to eq([])
        end
      end
    end

    describe "#my_transpose" do 
      context "when all arrays share the same length" do 
        it "returns a maxtrix" do 
          expect([].my_transpose).to eq([])
        end
      end
  
    end







end