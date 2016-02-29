{:user {:plugins [[cider/cider-nrepl "0.11.0-SNAPSHOT"]
                  [refactor-nrepl "2.2.0-SNAPSHOT"]
                  [lein-ancient "0.6.8"]
                  [codox "0.9.4"]
                  [lein-ritz "0.7.0"]
                  [lein-midje "3.2"]
                  [lein-midje-doc "0.0.24"]
                  [lein-ring "0.9.7"]
                  [lein-try "0.4.3"]
                  [lein-localrepo "0.5.3"]
                  [lein-cljsbuild "1.1.2"]
                  [lein-clojars "0.9.1"]
                  [lein-auto "0.1.2"]
                  [lein-shell "0.5.0"]
                  [mvxcvi/whidbey "1.3.0"]
                  [venantius/ultra "0.4.0"]]

        :dependencies [[spyscope "0.1.5"]
                       [org.clojure/tools.namespace "0.2.10"]
                       [io.aviso/pretty "0.1.23"]
                       [im.chit/vinyasa "0.4.2"]
                       [alembic "0.3.2"]
                       [leiningen "2.6.1"]
                       ]

        :injections [(require 'spyscope.core)
                     (require '[vinyasa.inject :as inject])
                     (require 'alembic.still)
                     (require 'io.aviso.repl)

                     (inject/in

                      ;; the default injected namespace is `.`
                      ;; note that `:refer, :all and :exclude can be used
                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [vinyasa.lein :refer [lein] :exclude [*project*]]
                      [alembic.still :refer [distill load-project]]

                      [clojure.tools.namespace.repl :refer [refresh]]

                      ;; inject into clojure.core
                      clojure.core
                      [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

                      ;; inject into clojure.core with prefix
                      clojure.core >
                      [clojure.pprint pprint]
                      [clojure.java.shell sh])

                     (alter-var-root #'clojure.main/repl-caught
                                     (constantly @#'io.aviso.repl/pretty-pst))
                     (alter-var-root #'clojure.repl/pst
                                     (constantly @#'io.aviso.repl/pretty-pst))]}}
