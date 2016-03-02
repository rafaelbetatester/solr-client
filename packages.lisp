
(defpackage :utils
  (:use :cl)
  (:export
   #:*solr-path*
   #:*test-core*))

(defpackage :search
  (:use :cl :cl-json :drakma :utils))

(defpackage :add-document
  (:use :cl :cl-json :drakma :utils))

