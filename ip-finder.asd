(defsystem "ip-finder"
           :version "0.1.0"
           :author "Daniel Jay Haskin"
           :license "MIT"
           :depends-on (
                        "dexador"
                        "cl-yaml"
                        )
           :components ((:module "src"
                                 :components
                                 ((:file "main"))))
           :description "IP address finder."
           :in-order-to ((test-op (test-op "ip-finder/tests"))))

(defsystem "ip-finder/tests"
           :version "0.1.0"
           :author "Daniel Jay Haskin"
           :license "MIT"
           :depends-on (
                        "ip-finder"
                        "rove"
                        )
           :components ((:module "tests"
                                 :components
                                 ((:file "main"))))
           :description "Test system for ip-finder"
           :perform (test-op (op c) (symbol-call :rove :run c)))