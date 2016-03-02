(ql:quickload :drakma)
(ql:quickload :cl-json)

(defun do-search (&rest terms)
  (let ((query-string (format nil "~{~A~^+AND+~}" terms)))
    (cl-json:decode-json-from-string
     (drakma:http-request
      (concatenate 'string 
		   "http://localhost:8983/solr/rafael-teste/select?q="
		   query-string
		   "&wt=json")))))
    

 
(defun fetched-do-search (q-value &key (start 0) (rows 10))
	      (cl-json:decode-json-from-string
		  (drakma:http-request
		   (concatenate 'string 
				"http://localhost:8983/solr/rafael-teste/select?q="
				(format nil "~a&start=~a&rows=~a" q-value start rows)
				"&wt=json"))))
