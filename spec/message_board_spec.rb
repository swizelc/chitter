require 'message_board'

RSpec.describe Message_board do 
    describe '.all' do 
        it 'returns all messages' do
            Message_board.add("Hello")
            Message_board.add("Hi")
            messages = Message_board.all
            expect(messages.first.message).to include "Hello"
            expect(messages[1].message).to include "Hi"
            
        end 
    end 
    describe '.add' do 
        it 'Adds a new message to the db' do 
            expect(Message_board.add("Hello")).to eq true
        end 
    end 
    describe '.delete' do 
        it 'Adds a new message to the db' do 
            Message_board.add("Hello")
            expect(Message_board.delete(id: "1")).to eq true
        end 
    end
end 