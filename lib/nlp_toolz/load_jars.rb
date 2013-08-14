module NlpToolz
  MODELS = File.join(File.dirname(__FILE__), '..', '..', "models")
  JARS = File.join(File.dirname(__FILE__), '..', '..', "jars")
  
  CLASS_PATH = [
    File.join(JARS, "jwnl-1.3.3.jar"),
    File.join(JARS, "opennlp-tools-1.5.3.jar"),
    File.join(JARS, "opennlp-maxent-3.0.3.jar")
  ].join(":")
  
  Rjb::load(CLASS_PATH,['-Xmx4096m','-Djava.awt.headless=true'])
  # Rjb::load(CLASS_PATH,['-Xmx4096m','-XX:+UseParallelGC','-XX:+UseParallelOldGC','-Djava.awt.headless=true'])
  # Rjb::load(CLASS_PATH,['-Xmx4096m','-XX:+UseConcMarkSweepGC','-Djava.awt.headless=true'])
  # Rjb::load(CLASS_PATH,['-Xmx4096m','-XX:+UseSerialGC','-Djava.awt.headless=true'])
end