{:user {:dependencies [[org.clojure/tools.nrepl "0.2.12"]
                       [im.chit/lucid.core.inject "1.3.13"]]
        :injections [(use 'lucid.core.inject)
                     (inject '[clojure.core
                               [clojure.pprint pprint]
                               [clojure.java.javadoc javadoc]
                               [clojure.reflect reflect]
                               [clojure.repl apropos dir doc find-doc pst source]])]
        :plugins [[refactor-nrepl "2.4.0"]
                  [cider/cider-nrepl "0.18.0"]
                  [lein-try "0.4.3"]
                  [lein-ancient "0.6.15"]]}}
