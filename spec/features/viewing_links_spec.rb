feature 'Viewing Links' do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.theguardian.com', title: 'theguardian', tags: [Tag.first_or_create(name: 'news')])
  end

  scenario 'so I can see a list of links' do
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario 'so I can filter links by tags' do
    visit '/tags/news'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).to have_content('theguardian')
    end

  end
end
