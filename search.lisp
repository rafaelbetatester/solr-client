(in-package search)

(defun do-search (&rest terms)
  (let ((query-string (format nil "~{~A~^+AND+~}" terms)))
    (cl-json:decode-json-from-string
     (drakma:http-request
      (concatenate 'string 
		   *solr-path*
		   *test-core*
		   "/select?q="
		   query-string
		   "&wt=json")))))
    

 
(defun fetched-do-search (q-value &key (start 0) (rows 10))
	      (cl-json:decode-json-from-string
		  (drakma:http-request
		   (concatenate 'string 
				*solr-path*
				*test-core*
				"/select?q="
				(format nil "~a&start=~a&rows=~a" q-value start rows)
				"&wt=json"))))
