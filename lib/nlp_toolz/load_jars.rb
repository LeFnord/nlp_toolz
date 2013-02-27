module NlpToolz
  CLASS_PATH = [
                 File.join(File.dirname(__FILE__), '..', '..', "jars/jwnl-1.3.3.jar"),
                 File.join(File.dirname(__FILE__), '..', '..', "jars/opennlp-tools-1.5.2.jar"),
                 File.join(File.dirname(__FILE__), '..', '..', "jars/opennlp-maxent-3.0.2.jar")
               ].join(":")
  
  Rjb::load(CLASS_PATH,['-Xmx2048m','-Djava.awt.headless=true'])
end