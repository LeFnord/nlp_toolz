# coding: utf-8
require "spec_helper"

describe NlpToolz do
  before(:each) do
    @text = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author. He served as a general in the United States Army during the American Civil War (1861–65), receiving both recognition for his outstanding command of military strategy, and criticism for the harshness of the scorched earth policies he implemented in conducting total war against the Confederate States of America. Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
    @part_text = "Kitaro Nishidas Text „Die Welt der Physik“ wurde zuerst 1944 in Januar in der Zeitschrift „Shisô“ Nr. 260 und erneut 1945 als ein Teil des Buches „Tetsugaku-ronbun-shû (Philosophische Aufsätzesammlung) 6“ veröffentlicht. Die Übersetzung beruht auf der jüngsten Ausgabe des Nishida-Gesamtwerks in japanischer Sprache, der Aufsatz befindet sich im zehnten Band dieser Reihe. Die westliche Forschung interessierte sich bislang vordergründig für Nishidas Religionsphilosophie. Der vorliegende, bislang unübersetzte Aufsatz offenbart nun Kitarô Nishidas großes Interesse an Theorien der modernen Physik, in welcher er offenbar eine Verifikation seiner eigenen Metaphysik zu finden glaubte. Dieser Zug in Nishidas Philosophie ist bislang weitgehend unerforscht. Es ist zwar bekannt, dass Nishida, dessen Grundidee der „reinen Erfahrung“ durch den Zen-Buddhismus stimuliert wurde, sich Zeit seines Lebens intensiv mit westlichen Philosophien wie der von Leibniz, Kant, Kierkegaard, Bergson, James etc. auseinandergesetzt hat. Weitaus weniger bekannt ist jedoch, dass er sich seit seiner Jugendzeit ebenfalls stark für Mathematik, vor allem Zahlentheorie, Mengentheorie und Gruppentheorie interessierte, und dass dieses Interesse ihn letztlich zur zeitgenössischen Physik führte. Symbolisch für diese Haltung ist die Tatsache, dass Nishida einer der engagierten Initiatoren der Japan-Reise Einsteins im Jahr 1922 war. Ein wichtiges Ziel der Philosophie Nishidas war der Versuch, das dichotomische Schema von Subjekt und Objekt zu überwinden, welches dem westlichen Denken zugrunde liegt. Darauf zielten neben dem mittlerweile weithin bekannten Begriff der „reinen Erfahrung“ Begriffe und Konzepte wie die „Logik des Prädikats“, „Basho“, „Selbstgewahren“, „handelnde Intuition“ und „absolut widersprüchliche Selbstidentität“. Diese von ihm entwickelten Begriffe spiegeln die Weiterentwicklung und den stetigen Ausbau seiner Gedanken in Aufsätzen wieder. Vor allem in seinen späten Lebensjahren versuchte er dabei, einen Bezug zwischen seiner Philosophie und neuen Theorien der Physik, insbesondere der Relativitätstheorie Einsteins, der Quantenmechanik und dem Unbestimmtheitsprinzip Heisenbergs sowie der Lorentz-Transformation herzustellen. Die vorliegende Übersetzung verdeutlicht diesen bislang vernachlässigten Aspekt seines Werks. Stilistisch gesehen handelt es sich bei „Die Welt der Physik“ um einen typischen Text Nishidas. Er verlangt vom Leser viel ab und dürfte viele zunächst abschrecken. Vor allem solche, die sich vorab noch nicht mit Nishidas Philosophie beschäftigt haben. Nishida selbst hat dies selbst wohl sehr deutlich gesehen, weshalb er seinen Aufsatz tatsächlich mit einer Warnung an potentielle Leser aus der Naturwissenschaft beginnt. Ihnen schlägt er vor, gleich mit dem zweiten, physikalischen Kapitel seiner Schrift zu beginnen, und das erste, philosophische Kapitel aufgrund seiner Abstraktheit zunächst unbeachtet zu lassen. Nishidas darin in Perfektion zu Tage tretender Stil hat jedoch Methode. Nishida schrieb seine Aufsätze oft in direkter Folge meditationsähnlicher Kontemplation und verzichtete weitgehend auf eine spätere Revision. Von einem Ausgangspunkt oder Denkansatz ausgehend weitet Nishida seine Gedanken spiralförmig aus, wobei er zentrale Thesen fast mantraartig wiederholt. In dieser Schreibweise wollte er die Dynamik des Denkens im gegenwärtigen Akt des Lesens widerzuspiegeln. Geht man davon aus, dass ihm dies gelungen ist, manifestieren sich bereits im Stil von Nishidas Arbeiten wesentliche Inhalte seiner Philosophie. Für die Übersetzung des Textes wurde daher versucht, diesen Stil möglichst originalgetreu wiederzugeben, um Nishidas Denken möglichst unverfälscht zu übermitteln. Der vorliegende Aufsatz ist Nishidas Versuch, seine eigene Erkenntnistheorie zu vergegenwärtigen, um jene sodann auf die Begriffe von Zeit, Raum und Kausalität zu beziehen. Vor allem letztere Eigenschaft macht den Text in unseren Augen interessant, weniger die schlichte Wiederholung bzw. Vergegenwärtigung seiner Metaphysik. Diese ist in vielen anderen Aufsätzen mehrfach wiedergegeben, auch in verschiedenen Übersetzungen, in Teilen übrigens klarer und besser verständlich als im vorliegenden Fall.3 Im Gegensatz zu anderen Aufsätzen tritt dem Leser der „Welt der Physik“ jedoch Nishidas ontologischer Standpunkt von Beginn an sehr deutlich entgegen, wesentlich deutlicher als in vergleichbaren Texten. Und dieser Standpunkt birgt eine Überraschung: Nishida verstand sich demnach selbst offenbar als Realist, d.h. er hielt die Welt, die uns umgibt, nicht nur für real, sondern er glaubte, dass deren Grunddeterminanten im positivistischen Sinne verstehbar und beschreibbar sind. An einer Stelle des Aufsatzes bezeichnet er sich selbst sogar als einen „Positivisten“. Mehrfach wendet er sich gegen subjektivistische Tendenzen, in denen „Realität“ als etwas sekundäres, vom Subjekt hergestelltes (oder nachträglich konstruiertes) betrachtet wird. Für Nishida erschafft sich die Welt in jeder Sekunde ihres Bestehens selbst, und zwar aus dem Wechselwirken zwischen den beteiligten Tatsachen (koto).4 Die „Realität“ ist damit nicht etwa als Summe beteiligter koto darstellbar. In seiner Vorstellung von Basho entsteht die reale Welt im Gegenwärtigen, kontinuierlich, und zwar aus dem „Zwischen“ der koto, aus dem sprachlich nicht fixierbaren „Feld“ ihrer Beziehungen zueinander. Da dieses Feld normalsprachlich nicht eingenommen werden kann, und da, würde man es doch versuchen, das Feld notwendigerweise zum Subjekt oder zum Objekt degradiert würde und somit seine eigentliche Qualität als „zwischen Subjekt und Objekt stehend“ verloren ginge, entwickelte Nishida den Duktus vom „Widersprüchlich-Selbstidentischen“ bzw. von der „absolut widersprüchlichen Selbstidentität“. Die ontologische Beschreibung der Realität gestaltet sich in normalsprachlicher Hinsicht damit paradox. Der frühe Wittgenstein hätte an dieser Stelle gefolgert, dass man daher über die Metaphysik für immer schweigen müsse. Nishida dagegen – und hier zeigt sich die Eigentümlichkeit seiner Selbstbeschreibung als „Positivist“ – zieht die genau gegenteilige Schlussfolgerung: Paradoxien zählen für ihn zum ontologischen Status der Realität selbst. Und eine Logik, die sich diesem Status annähern möchte, muss daher Paradoxien integrieren. Typisch für Nishidas spätes Werk ist dabei die Annahme einer „Handlungsintuition“, die auch im vorliegenden Aufsatz bedeutsam ist: Demnach ist ein unmittelbares Erkennen, das eigentlich noch keinen Unterschied von Subjekt und Objekt kennt, untrennbar verknüpft mit einem jeweiligen gegenwärtigen Akt. Im Moment einer Handlung konstituiert sich Realität gewissermaßen aus dem Feld zwischen Subjekt und Objekt. Daher muss ein Feld bestehen, in dem sich Subjekt und Objekt voneinander untrennbar bewegen und sich durch diese Dynamik erzeugen. Für Nishida existieren auch Raum und Zeit in einem solchen untrennbaren Verhältnis und erzeugen sich durch Akte gewissermaßen gegenseitig und zugleich selbst. Physikalische Realität besteht aus physikalischen Phänomenen. In Nishidas Augen entstehen diese jedoch aus dem Feld zwischen den koto. Betrachtet man diesen Prozess sprachlich-objektivierend, so scheint es, dass jedes koto jedes andere nicht nur logisch bedingt, sondern hervorzubringen scheint; ein paradoxer Prozess des „Entstehens und Entschwindens“ von widersprüchlich-selbstidentischen koto beginnt, in dem nicht nur jedes einzelne koto jeweils jedes andere hervorbringt und zugleich von ihm hervorgebracht wird. Mehr noch: Jedes koto determiniert jedes andere koto sowohl beim Entstehen, als auch beim Entschwinden, und wird zugleich von anderen selbst determiniert. In Nishidas Worten existieren koto daher allesamt im Zustand „widersprüchlicher Selbstidentität“, d.h. in einer fortwährenden Paradoxie. In der Vorstellung Nishidas stellen jene koto nun Kraftpunkte dar, denen kreative Eigenschaften zukommen, allerdings nur in Verbindung mit allen anderen koto. Stellt man sich die Summe aller koto etwa als Netz vor, würde das bedeuten, dass jeder einzelne Knoten- oder Kraftpunkt die Gestalt des Gesamtnetzes determiniert und zugleich von ihm determiniert wird. Analogien zum Monadenbegriff von Leibniz sind hier augenscheinlich und werden von Nishida auch angesprochen."
    @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
  end

  describe "detect language" do
    it "should description" do
      lang = NlpToolz.get_lang(@text)
      lang.should == 'en'
    end
  end
  
  describe "sentence detection" do
    it "should input text split into its sentences" do
      sentences = NlpToolz.get_sentences(@text)
      sentences.should have(3).items
    end
    
    it "should be 'nil', if text lang is unsupported" do
      sentences = NlpToolz.get_sentences(@g_text)
      sentences.should be_nil
    end
  end
  
  describe "tagging" do
    it "should tag a sentence" do
      sentence = NlpToolz.get_sentences(@text).last
      tags = NlpToolz.tag_sentence(sentence)
      tags[:token].length.should == tags[:tag].length
    end
    
    it "should be 'nil', if sentence language not supported " do
      tags = NlpToolz.tag_sentence(@g_text)
      tags.should be_nil
    end
    
    it "should tag a whole text" do
      tagged_sentences = NlpToolz.tag_text(@part_text)
      tagged_sentences.should have(52).items
      tagged_sentences.should be_a Array
      tagged_sentences.first.should be_a Hash
      tagged_sentences.first[:token].length.should == tagged_sentences.first[:tag].length
    end
    
    it "should tag a whole text /wo splitting into sentences" do
      tagged_sentences = NlpToolz.tag_sentence(@text)
      tagged_sentences.should be_a Hash
      tagged_sentences[:token].length.should == tagged_sentences[:tag].length
    end
  end
  
  describe "parsing" do
    it "should parse a sentence" do
      sentence = NlpToolz.get_sentences(@text).last
      parsed = NlpToolz.parse_sentence(sentence)
      parsed.should be_a Hash
    end
    
    it "should should be 'nil', if sentence language is not supported" do
      parsed = NlpToolz.parse_sentence(@g_text)
      parsed.should be_nil
    end
    
    it "should parse a whole text" do
      parsed_sentences = NlpToolz.parse_text(@part_text)
      parsed_sentences.should have(52).items
      parsed_sentences.should be_a Array
    end
  end
end
