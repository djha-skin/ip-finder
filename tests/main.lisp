(in-package #:cl-user)
(defpackage #:ip-finder/tests
  (:use #:cl
        #:rove)
  (:import-from
    #:ip-finder))

(in-package :ip-finder/tests)

(deftest
  main
  (testing "main"
    (ok (equal (ip-finder:main :out-stream nil :http-get (lambda (addr)
                                    (declare (ignore addr))
                                    "  127.0.0.1\n\n\t "))
              "ip: \"127.0.0.1\""))))
