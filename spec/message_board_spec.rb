require 'message_board'

RSpec.describe Message_board do 
    describe '.all' do 
        it 'returns all messages' do
            Message_board.add("Hello")
            Message_board.add("Hi")
            message = Message_board.all
            expect(message).to include "Hello"
            expect(message).to include "Hi"
            Message_board.delete("Hello")
            Message_board.delete("Hi")
        end 
    end 
    describe '.add' do 
        it 'Adds a new message to the db' do 
            expect(Message_board.add("Hello")).to eq true
            Message_board.delete("Hello")
        end 
    end 
    describe '.delete' do 
        it 'Adds a new message to the db' do 
            Message_board.add("Hello")
            expect(Message_board.delete("Hello")).to eq true
        end 
    end
end 