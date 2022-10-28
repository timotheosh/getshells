;;;; getshells.asd

(asdf:defsystem #:getshells
  :description "Describe getshells here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "getshells"))
  :build-operation "asdf:program-op"
  :build-pathname "target/getshells"
  :entry-point "getshells:-main")

