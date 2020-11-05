require 'user'

RSpec.describe User do 
    describe '.all' do 
        it 'returns all the users' do 
            User.create_user(username: "test", password: "test")
            expect(User.all.length).to eq 1
            expect(User.all[0].username).to eq "test"
        end 
    end 
    describe '.check_login' do 
        it 'returns true if the user exists and the password is correct' do
            User.create_user(username: "test", password: "test")
            expect(User.check_login(username: "test", password: "test")).to eq true
        end
        it 'returns false if user doesnt exist' do 
            expect(User.check_login(username: "test", password: "test")).to eq false
        end 
        it 'returns false is the password is incorret' do 
            User.create_user(username: "test", password: "test")
            expect(User.check_login(username: "test", password: "test1")).to eq false
        end 
    end 

    describe '.find_user' do 
        it 'returns an object of goven id' do 
            User.create_user(username: "test", password: "test")
            expect(User.find_user(id: User.current_user).username).to eq "test"
        end 
    end

end 