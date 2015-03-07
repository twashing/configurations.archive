{:user {:plugins [[cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [venantius/ultra "0.3.2"]
                  ;;[lein-ancient "0.5.5"]
                  ;;[codox "0.8.10"]
                  ;;[lein-ritz "0.7.0"]
                  ;;[lein-midje "3.1.3"]
                  ;;[lein-midje-doc "0.0.22"]
                  ;;[lein-ring "0.8.11"]
                  ;;[lein-try "0.4.1"]
                  ;;[lein-localrepo "0.5.3"]
                  ;;[alembic "0.2.1"]

                  ;;[lein-cljsbuild "1.0.3"]
                  ;;[lein-clojars "0.9.1"]
                  ;;[lein-auto "0.1.1"]
                  ;;[lein-shell "0.4.0"]

                  ;; [mvxcvi/whidbey "0.5.0"]
                  ;; [venantius/ultra "0.2.0"]
                  ]

        :dependencies [[alembic "0.3.2"]
                       [spyscope "0.1.4"]
                       [org.clojure/tools.namespace "0.2.7"]
                       [io.aviso/pretty "0.1.17"]
                       [im.chit/vinyasa "0.3.4"]]

        :injections [(require 'spyscope.core)
                     (require '[vinyasa.inject :as inject])
                     (require 'io.aviso.repl)
                     (require 'alembic.still)
                     
                     (inject/in clojure.core >
                                [alembic.still load-project]
                                [clojure.pprint pprint]
                                [clojure.repl apropos])]}}
