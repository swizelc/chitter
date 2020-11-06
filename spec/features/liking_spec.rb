feature 'like a peep' do 
    scenario 'user likes a peep' do 
        create_account('test', 'test')
        add_peep
        first('.peep').click_button 'LIKE'
        expect(first('.peep')).to have_content '1'
    end 
end 