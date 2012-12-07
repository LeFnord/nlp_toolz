# coding: utf-8
require "spec_helper"

describe NlpToolz do
  before(:each) do
    @text = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author.
             He served as a general in the United States Army during the American Civil War (1861–65), receiving both recognition for his outstanding command of military strategy, and criticism for the harshness of the scorched earth policies he implemented in conducting total war against the Confederate States of America.
             Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
  end
  
  describe "sentence detection" do
    it "should input text into its sentences" do
      sentences = NlpToolz.get_sentences(@text)
      sentences.should have(3).items
    end
  end
end