{:user {:plugins [[cider/cider-nrepl "0.13.0-snapshot"]
                  [refactor-nrepl "2.2.0"]
                  [lein-ancient "0.6.10"]
                  [lein-ring "0.9.7"]
                  [lein-try "0.4.3"]
                  [lein-cljsbuild "1.1.3"]
                  [lein-environ "1.0.3"]
                  [mvxcvi/whidbey "1.3.0"]
                  [venantius/ultra "0.4.1"]]

        :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                       [org.clojure/tools.namespace "0.2.10"]
                       [spyscope "0.1.5"]
                       [io.aviso/pretty "0.1.27"]
                       [im.chit/vinyasa "0.4.7"]
                       [leiningen "2.6.1" :exclusions [slingshot
                                                       org.apache.maven.wagon/wagon-provider-api
                                                       org.codehaus.plexus/plexus-utils
                                                       commons-logging]]
                       [org.apache.maven/maven-aether-provider "3.0.5"]]

        :injections [(require 'spyscope.core)
                     (require '[vinyasa.inject :as inject])
                     (require 'io.aviso.repl)

                     (inject/in

                      ;; the default injected namespace is `.`
                      ;; note that `:refer, :all and :exclude can be used
                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [vinyasa.lein :refer [lein] :exclude [*project*]]
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
