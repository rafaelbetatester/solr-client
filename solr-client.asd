
(asdf:defsystem #:solr-client
    :serial t
    :depends-on ("cl-json" "hunchentoot" "drakma")
    :components ((:file "packages")
		 (:file "utils"            :depends-on ("packages"))
		 (:file "search"           :depends-on ("utils"))
		 (:file "add-document"     :depends-on ("utils"))))  
		 
