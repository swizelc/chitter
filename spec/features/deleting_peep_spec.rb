feature 'Deletign a peep' do 
    scenario 'user deleting a peep' do
        Chitter_board.add("Test peep")
        visit '/chitter_board'
        expect(page).to have_content 'Test peep'
        first('.peep').click_button 'Delete'
        expect(current_path).to eq '/chitter_board'
        expect(page).not_to have_content 'Test peep'
    end 
end 