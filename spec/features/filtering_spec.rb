feature 'filter peeps on a specific keyword' do 
    scenario 'there is a screach field on the page' do
        create_account("test", "test") 
        expect(page).to have_field 'keyword'
    end 
    scenario 'submiting the keyword will take them to a results page' do 
        create_account("test", "test") 
        fill_in 'keyword', with: 'testing'
        click_button 'search' 
        expect(current_path).to eq '/searchresults'
    end 
    scenario 'get correct sreach results' do 
        create_account("test", "test") 
        add_peep 
        fill_in 'keyword', with: 'test'
        click_button 'search'
        expect(page).to have_content 'test'

    end 
end 