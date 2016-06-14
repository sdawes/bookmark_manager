feature 'Adding tags' do
  scenario 'So I can tag links' do
    visit '/links/new'
    fill_in(:title, with: "theguardian")
    fill_in(:url, with: "http://www.theguardian.com")
    fill_in(:tags, with: "news leftwing")

    click_button('Add Link')

    link = Link.first
    # get the tags that link has and use map so only returns tag names (ignore ids). See if news is in tag names.
    expect(link.tags.map(&:name)).to include('news', 'leftwing')
    # expect(link.tags.map { |x| x.name }).to include('news')
  end
end
