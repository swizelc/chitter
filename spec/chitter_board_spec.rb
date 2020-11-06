require 'chitter_board'

RSpec.describe Chitter_board do 
    describe '.all' do 
        it 'returns all peeps' do
            Chitter_board.add(peep: "Hello", user_id: "1")
            Chitter_board.add(peep: "Hi", user_id: "1")
            peeps = Chitter_board.all
            expect(peeps.first.message).to include "Hello"
            expect(peeps[1].message).to include "Hi"
            
        end 
    end 
    describe '.add' do 
        it 'Adds a new peep to the db' do 
            expect(Chitter_board.add(peep: "Hello", user_id: "1")).to eq true
        end 
    end 
    describe '.delete' do 
        it 'deltes a peep from the db' do 
            Chitter_board.add(peep: "Hello", user_id: "1")
            expect(Chitter_board.delete(id: "1")).to eq true
        end 
    end
    describe '.like' do 
        it 'increses the number of likes on a peep' do 
            Chitter_board.add(peep: "Hello", user_id: "1")
            expect(DatabaseConnection).to receive(:query).with "UPDATE peeps SET likes = likes + 1 WHERE id = '#{1}';"
            Chitter_board.like(id: 1)
        end 
    end
end 