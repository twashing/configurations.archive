{:user
 {:plugins [[lein-ancient "0.5.5"]
            [codox "0.8.8"]
            [lein-ritz "0.7.0"]
            [lein-midje "3.1.3"]
            [lein-midje-doc "0.0.22"]
            [lein-ring "0.8.10"]
            [lein-try "0.4.1"]
            [lein-localrepo "0.5.3"]
            [alembic "0.2.1"]
            [hiccup-bridge "1.0.0-SNAPSHOT"]
            ;; [com.cemerick/austin "0.1.4"]
            [lein-cljsbuild "1.0.3"]
            [lein-release "1.1.3"]]
  :dependencies [[nrepl-inspect "0.4.1"]
                 [ritz/ritz-nrepl-middleware "0.7.0"]

                 [com.cemerick/pomegranate "0.3.0"]
                 ;;[com.cemerick/piggieback "0.1.3"]
                 [leiningen #= (leiningen.core.main/leiningen-version)]
                 [im.chit/vinyasa "0.2.0"]
                 [org.clojars.gjahad/debug-repl "0.3.3"]]
  :injections [(require '[vinyasa.inject :as inj])
               (require 'alex-and-georges.debug-repl)
               (inj/inject 'clojure.core '>
                           '[[alex-and-georges.debug-repl debug-repl]

                             [vinyasa.inject inject]
                             [vinyasa.pull pull]
                             [vinyasa.lein lein]
                             [vinyasa.reimport reimport]

                             [cemerick.pomegranate add-classpath get-classpath resources]
                             [clojure.java.io resource]
                             [clojure.tools.namespace.repl refresh]
                             [clojure.repl apropos dir doc find-doc source pst
                              [root-cause >cause]]

                             [clojure.pprint pprint pp]])]

  :repl-options {:nrepl-middleware
                 [ritz.nrepl.middleware.javadoc/wrap-javadoc
                  ritz.nrepl.middleware.simple-complete/wrap-simple-complete
                  inspector.middleware/wrap-inspect]}}}
