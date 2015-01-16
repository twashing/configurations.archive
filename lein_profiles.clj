{:user
 {:plugins [[lein-ancient "0.5.5"]
            [codox "0.8.10"]
            [lein-ritz "0.7.0"]
            [lein-midje "3.1.3"]
            [lein-midje-doc "0.0.22"]
            [lein-ring "0.8.11"]
            [lein-try "0.4.1"]
            [lein-localrepo "0.5.3"]
            [alembic "0.2.1"]
            [cider/cider-nrepl "0.8.1"]
            [lein-cljsbuild "1.0.3"]
            [lein-clojars "0.9.1"]
            [lein-auto "0.1.1"]
            [lein-shell "0.4.0"]]

  :dependencies [[org.clojure/tools.namespace "0.2.7"]
                 [im.chit/vinyasa "0.2.2"]
                 [spyscope "0.1.4"]]

  :injections [(require 'spyscope.core)
               (require '[vinyasa.inject :as inject])
               (inject/in [vinyasa.pull :all]

                          clojure.core
                          [iroh.core .> .? .* .% .%>])]}}
