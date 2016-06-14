feature 'Creating links' do
  scenario 'so that I can add new links' do
    visit '/links/new'
    fill_in(:title, with: "theguardian")
    fill_in(:url, with: "http://www.theguardian.com")
    click_button('Add Link')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('theguardian')
    end
  end
end
