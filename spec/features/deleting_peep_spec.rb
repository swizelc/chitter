feature 'Deletign a peep' do 
    scenario 'user deleting a peep' do
        create_account("test", "test")
        add_peep
        expect(page).to have_content 'test'
        first('.peep').click_button 'x'
        expect(current_path).to eq '/chitter_board'
        expect(page).not_to have_content 'Test peep'
    end  
    scenario ' user cannot delete another users peeps' do
        create_account("test", "test")
        add_peep
        expect(page).to have_content 'test'
        create_account("first", "test2")
        expect(current_path).to eq '/chitter_board'
        #expect(first('.peep')).to have_no_button('x')
    end 
end 