feature 'Adding a new messgae' do 
    scenario 'A user add a messgae' do 
        visit '/add_message'
        fill_in("message", with: 'Test message')
        click_button 'Submit'
        expect(current_path).to eq '/message_board'
        expect(page).to have_content 'Test message'
    end
end 