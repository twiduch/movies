RSpec.describe ApplicationHelper do
  context '#svg' do
    it 'returns svg' do
      expect(helper.svg('loupe')).to match(/svg class="w-5 h-5/)
    end
  end

  context '#proper_url?' do
    it 'returns true if proper url' do
      expect(helper.proper_url?('https://abc.com?par=4')).to be(true)
    end

    it 'returns false if proper url' do
      expect(helper.proper_url?('wrong')).to be(false)
    end
  end
end
