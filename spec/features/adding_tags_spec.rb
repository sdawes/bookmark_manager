feature 'Adding tags' do
  scenario 'So I can tag links' do
    visit '/links/new'
    fill_in(:title, with: "theguardian")
    fill_in(:url, with: "http://www.theguardian.com")
    fill_in(:tags, with: "news")

    click_button('Add Link')

    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
    # expect(link.tags.map { |x| x.name }).to include('news')
  end
end
