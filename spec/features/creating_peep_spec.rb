feature 'Adding a new peep' do 
    scenario 'A user add a peep' do 
        visit '/add_peep'
        fill_in("peep", with: 'Test peep')
        click_button 'Submit'
        expect(current_path).to eq '/chitter_board'
        expect(page).to have_content 'Test peep'
    end
end 