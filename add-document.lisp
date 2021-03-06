;;;;;; Dica -> Posso usar cxml library
(in-package add-document)

(defun keys-values-to-xml-string (keys-values-list)
  (with-output-to-string (stream)
    (format stream "<add><doc>")
    (dolist (kv keys-values-list)
      (format stream "<field name=\"")
      (format stream (car kv))
      (format stream "\">")
      (format stream (cdr kv))
      (format stream "\"</field>"))
    (format stream "</doc></add>")))

(defun do-add (keys-values-list)
  (drakma:http-request
   (concatenate 'string *solr-path* *test-core* "/update")
   :method :post
   :content-type "application/xml"
   :content ( keys-values-to-xml-string
	      keys-values-list)))

(defun commit-adds ()
  (drakma:http-request
   (concatenate 'string *solr-path* *test-core* "/update")
   :method :post
   :content-type "application/xml"
   :content "<commit></commit>"))
