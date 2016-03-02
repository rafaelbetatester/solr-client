
(asdf:defsystem #:solr-client
    :serial t
    :depends-on ("cl-json" "hunchentoot" "drakma")
    :components ((:file "packages")
		 (:file "search")
		 (:file "add-document")))
		 
