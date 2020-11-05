require 'date'
feature 'Adding a new peep' do 
    scenario 'A user add a peep' do 
        create_account("test", "test") 
        add_peep
        expect(current_path).to eq '/chitter_board'
        expect(page).to have_content 'test'
    end
    scenario 'the date shows up when a peep is added' do 
        create_account("test", "test") 
        add_peep
        date = DateTime.now.to_s[0..9]
        expect(current_path).to eq '/chitter_board'
        expect(page).to have_content date
    end 
end 