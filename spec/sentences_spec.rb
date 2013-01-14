# coding: utf-8
require "spec_helper"

# describe NlpToolz do
#   describe "Sentences" do
#     before(:each) do
#       @text = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author.
#                He served as a general in the United States Army during the American Civil War (1861–65), receiving both recognition for his outstanding command of military strategy, and criticism for the harshness of the scorched earth policies he implemented in conducting total war against the Confederate States of America.
#                Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
#       
#       @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
#     end
#     
#     describe "attributes" do
#       it "should respond to #attribute" do
#         sent = NlpToolz::Sentences.new(@text)
#         sent.should respond_to(:input)
#         sent.should respond_to(:lang)
#         sent.should respond_to(:model_name)
#         sent.should respond_to(:model)
#         sent.should respond_to(:sentences)
#       end
#     end
#     
#     describe "model" do
#       it "should have a model, if lang 'en'" do
#         sent = NlpToolz::Sentences.new(@text,'en')
#         sent.has_model?.should be_true
#         sent.model_name.should == 'en-sent.bin'
#       end
#       
#       it "should not have a model, if lang not known" do
#         sent = NlpToolz::Sentences.new(@g_text)
#         sent.has_model?.should be_false
#       end
#     end
#     
#     describe "object" do
#       it "should create a valid object" do
#         expect{ sent = NlpToolz::Sentences.new(@text) }.to_not raise_error
#       end
#     
#       it "should set the language of input" do
#         sent = NlpToolz::Sentences.new(@text)
#         sent.lang.should == "en"
#       end
#     
#       it "should build the right model name" do
#         sent = NlpToolz::Sentences.new(@text)
#         sent.model_name.should == "en-sent.bin"
#       end
#     
#       it "should split incoming text into sentences" do
#         text = NlpToolz::Sentences.new(@text,"en")
#         text.split_into_sentences
#         text.sentences.should have(3).items
#       end
#     end
#   end # Sentences
# end # NlpToolz
