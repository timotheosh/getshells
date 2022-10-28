;;;; getshells.lisp

(in-package #:getshells)

(defun split-passwd (file)
  (let ((lines (uiop:read-file-lines file)))
    (mapcan #'last
            (mapcar (lambda (line) (uiop:split-string line :separator ":")) lines))))

(defun inc (val)
  (if val
      (1+ val)
      1))

(defun occurrences (lst)
  (let ((table (make-hash-table :size (length lst) :test #'equal)))
    (loop for shell in lst do
      (setf (gethash shell table) (inc (gethash shell table))))
    table))

(defun -main (&rest argv)
  (declare (ignorable argv))
  (loop for k being the hash-keys in (occurrences (split-passwd "passwd")) using (hash-value v)
        do (format t "~a : ~a~%" k v)))
