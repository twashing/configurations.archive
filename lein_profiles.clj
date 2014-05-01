{:user
 {:plugins [[lein-midje "3.1.1"]
            [lein-try "0.4.1"]
            [lein-marginalia "0.7.1"]
            [lein-localrepo "0.5.3"]]
  :dependencies [[com.cemerick/pomegranate "0.3.0"]
                 [leiningen #= (leiningen.core.main/leiningen-version)]
                 [im.chit/vinyasa "0.1.9"]]
  :injections [(require '[vinyasa.inject :as inj])
               (inj/inject 'clojure.core '>
                           '[[vinyasa.inject inject]
                             [vinyasa.pull pull]
                             [vinyasa.lein lein]
                             [vinyasa.reimport reimport]
                             [cemerick.pomegranate add-classpath get-classpath resources]])]}}
