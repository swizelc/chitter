feature 'Deletign a message' do 
    scenario 'user deleting a messgae' do
        Message_board.add("Test message")
        visit '/message_board'
        expect(page).to have_content 'Test message'
        first('.message').click_button 'Delete'
        expect(current_path).to eq '/message_board'
        expect(page).not_to have_content 'Test message'
    end 
end 