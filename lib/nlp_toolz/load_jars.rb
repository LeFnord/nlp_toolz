module NlpToolz
  MODELS = File.join(File.dirname(__FILE__), '..', '..', "models")
  JARS = File.join(File.dirname(__FILE__), '..', '..', "jars")
  
  # CLASS_PATH = [
  #   File.join(JARS, "jwnl-1.3.3.jar"),
  #   File.join(JARS, "opennlp-tools-1.5.3.jar"),
  #   File.join(JARS, "opennlp-maxent-3.0.3.jar")
  # ].join(":")
  
  CLASS_PATH = Dir.glob(File.join(JARS,'*.jar')).join(':')
  
  Rjb::load(CLASS_PATH,['-X+C','-Xmx4096m','-Djava.awt.headless=true'])
  # Rjb::load(CLASS_PATH,['-Xmx4096m','-XX:+UseParallelGC','-XX:+UseParallelOldGC','-Djava.awt.headless=true'])
  # Rjb::load(CLASS_PATH,['-Xmx4096m','-XX:+UseConcMarkSweepGC','-Djava.awt.headless=true'])
  # Rjb::load(CLASS_PATH,['-Xmx4096m','-XX:+UseSerialGC','-Djava.awt.headless=true'])
end

# simple example benchmarks, pos tagging 862 pharses:
# /wo extra options  -> 656s
# /w ParallelGC      -> 657s
# /w ConcMarkSweepGC -> 659s
# /w SerialGC        -> 668s
# see: [Java GC tuning](http://www.oracle.com/technetwork/java/javase/gc-tuning-6-140523.html)