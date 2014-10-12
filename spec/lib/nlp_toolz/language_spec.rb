require "spec_helper"

describe 'Language' do
  
  before(:all) do
    @en_text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
    @de_text = "Die erste Ausgabe der von Arwidsson herausgegebenen, kurzlebigen Zeitschrift Abo Morgonblad vom 5. Januar 1821."
  end
  
  it 'do nothings if text empty or nil' do
    res = NlpToolz::Language.get_language_2
    expect(res).to be == -1
    res = NlpToolz::Language.get_language_2('')
    expect(res).to be == -1
  end
  
  it 'gets language' do
    res = NlpToolz::Language.get_language_2 @en_text
    expect(res).to be == 'en'
    res = NlpToolz::Language.get_language_2 @de_text
    expect(res).to be == 'de'
  end
end