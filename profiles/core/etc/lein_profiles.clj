{:user {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  [refactor-nrepl "2.0.0-SNAPSHOT"]
                  
                  [lein-ancient "0.6.8"]
                  [codox "0.9.0"]
                  [lein-ritz "0.7.0"]
                  [lein-midje "3.2"]
                  [lein-midje-doc "0.0.24"]
                  [lein-ring "0.9.7"]
                  [lein-try "0.4.3"]
                  [lein-localrepo "0.5.3"]
                  [alembic "0.3.2"]

                  [lein-cljsbuild "1.1.1"]
                  [lein-clojars "0.9.1"]
                  [lein-auto "0.1.2"]
                  [lein-shell "0.4.1"]

                  [mvxcvi/whidbey "1.3.0"]
                  [venantius/ultra "0.4.0"]
                  ]

        :dependencies [[alembic "0.3.2"]
                       [spyscope "0.1.5"]
                       [org.clojure/tools.namespace "0.2.10"]
                       [io.aviso/pretty "0.1.19"]
                       [im.chit/vinyasa "0.4.2"]]

        :injections [(require 'spyscope.core)
                     (require '[vinyasa.inject :as inject])
                     (require 'io.aviso.repl)
                     (require 'alembic.still)
                     
                     (inject/in clojure.core >
                                [alembic.still load-project]
                                [clojure.pprint pprint]
                                [clojure.repl apropos])]}}
