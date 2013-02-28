# coding: utf-8
require "spec_helper"

describe NlpToolz do
  describe "Parser" do
    before(:each) do
      @text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
      @l_text = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author. He served as a general in the United States Army during the American Civil War (1861–65), receiving both recognition for his outstanding command of military strategy, and criticism for the harshness of the scorched earth policies he implemented in conducting total war against the Confederate States of America. Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      @d_text = "Kitarö Nishidas Text 'Die Welt der Physik' wurde zuerst 1944 in Januar in der Zeitschrift „Shisô“ Nr. 260 und erneut 1945, als ein Teil des Buches „Tetsugaku-ronbun-sh (Philosophische Aufsätzesammlung/Schriftsammlung) 6“ veröffentlicht."
      @d_part = "Kitaro Nishidas Text „Die Welt der Physik“ wurde zuerst 1944 in Januar in der Zeitschrift „Shisô“ Nr. 260, und erneut 1945 als ein Teil des Buches „Tetsugaku-ronbun-shû (Philosophische Aufsätzesammlung) 6“ veröffentlicht. Die Übersetzung beruht auf der jüngsten Ausgabe des Nishida-Gesamtwerks in japanischer Sprache,"
      @d1     = "Don Melton arbeitete für Apple einst an WebKit und Safari und erinnert sich zurück an die Zeit, als der Name für den in Entwicklung befindenden Browser noch nicht feststand."
      @d_long = "Kitaro Nishidas Text „Die Welt der Physik“ wurde zuerst 1944 in Januar in der Zeitschrift „Shisô“ Nr. 260 und erneut 1945 als ein Teil des Buches „Tetsugaku-ronbun-shû (Philosophische Aufsätzesammlung) 6“ veröffentlicht. Die Übersetzung beruht auf der jüngsten Ausgabe des Nishida-Gesamtwerks in japanischer Sprache, der Aufsatz befindet sich im zehnten Band dieser Reihe. Die westliche Forschung interessierte sich bislang vordergründig für Nishidas Religionsphilosophie. Der vorliegende, bislang unübersetzte Aufsatz offenbart nun Kitarô Nishidas großes Interesse an Theorien der modernen Physik, in welcher er offenbar eine Verifikation seiner eigenen Metaphysik zu finden glaubte. Dieser Zug in Nishidas Philosophie ist bislang weitgehend unerforscht. Es ist zwar bekannt, dass Nishida, dessen Grundidee der „reinen Erfahrung“ durch den Zen-Buddhismus stimuliert wurde, sich Zeit seines Lebens intensiv mit westlichen Philosophien wie der von Leibniz, Kant, Kierkegaard, Bergson, James etc. auseinandergesetzt hat. Weitaus weniger bekannt ist jedoch, dass er sich seit seiner Jugendzeit ebenfalls stark für Mathematik, vor allem Zahlentheorie, Mengentheorie und Gruppentheorie interessierte, und dass dieses Interesse ihn letztlich zur zeitgenössischen Physik führte. Symbolisch für diese Haltung ist die Tatsache, dass Nishida einer der engagierten Initiatoren der Japan-Reise Einsteins im Jahr 1922 war."
    end
    
    describe "attributes" do
      it "should respond to #attribute" do
        text = NlpToolz::Parser.new(@text)
        text.should respond_to(:input)
        text.should respond_to(:lang)
        text.should respond_to(:model_name)
        text.should respond_to(:model)
        text.should respond_to(:parse_hash)
      end
    end
    
    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::Parser.new(@text,'en')
        sent.model_name.should == 'en-sm5.gr'
        sent.has_model?.should be_true
      end
      
      it "should not have a model, if lang not known" do
        sent = NlpToolz::Parser.new(@g_text)
        sent.has_model?.should be_false
      end
    end
    
    describe "object" do
      it "should create a valid object" do
        expect{ text = NlpToolz::Parser.new(@text,"en") }.to_not raise_error
      end
      
      it "should set the language of input" do
        text = NlpToolz::Parser.new(@text)
        text.lang.should == "en"
      end
      
      it "should build the right model name" do
        text = NlpToolz::Parser.new(@text)
        text.model_name.should == "en-sm5.gr"
      end
    end

    describe "parsing" do
      it "should store tree in a hash" do
        text = NlpToolz::Parser.new(@text)
        text.parse_text
        text.hash.should be_a(Hash)
      end

      it "should have a token hash after parsing" do
        text = NlpToolz::Parser.new(@text)
        text.parse_text
        text.layer.should be_a Hash
        text.layer.should include(:tags)
        text.layer.should include(:tokens)
      end
    end
  end # Parser
end # NlpToolz
