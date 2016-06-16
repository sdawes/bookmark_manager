<<<<<<< HEAD
feature 'create new links' do
  scenario 'fill in a form that creates a link' do
    visit 'links/new'
    fill_in('title', with: 'Apple')
    fill_in('url', with: 'http://www.apple.com')
    click_button('Submit')
    expect(page).to have_content('Apple')
=======
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
>>>>>>> b35914ebd2f96793a533e3c5c5c80210e9b67766
  end
end
