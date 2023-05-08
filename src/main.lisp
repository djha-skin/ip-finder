(in-package #:cl-user)
(defpackage
  #:ip-finder
  (:use #:cl)
  (:documentation
    "
    The ip-finder command gets the public IP address from the caller as
    observed by `icanhazip.com`.
    "
    )
    (:import-from #:dexador)
    (:import-from #:cl-yaml)
    (:export
      main))
(in-package #:ip-finder)

(defun main (&key
              ;; Dependency Injection for tests
              (out-stream t)
              (http-get #'dexador:get)
              (url "https://icanhazip.com"))
    "Get my IP address."
    (let ((ip (string-trim "\n\t " (funcall http-get url))))
      (format out-stream "ip: ~A" (cl-yaml:emit-to-string ip))))