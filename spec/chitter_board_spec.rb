require 'chitter_board'

RSpec.describe Chitter_board do 
    describe '.all' do 
        it 'returns all peeps' do
            Chitter_board.add("Hello")
            Chitter_board.add("Hi")
            peeps = Chitter_board.all
            expect(peeps.first.peep).to include "Hello"
            expect(peeps[1].peep).to include "Hi"
            
        end 
    end 
    describe '.add' do 
        it 'Adds a new peep to the db' do 
            expect(Chitter_board.add("Hello")).to eq true
        end 
    end 
    describe '.delete' do 
        it 'Adds a new peep to the db' do 
            Chitter_board.add("Hello")
            expect(Chitter_board.delete(id: "1")).to eq true
        end 
    end
end 