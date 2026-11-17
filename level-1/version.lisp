;;;-*-Mode: LISP; Package: CCL -*-
;;;
;;; Copyright 1994-2009 Clozure Associates
;;;
;;; Licensed under the Apache License, Version 2.0 (the "License");
;;; you may not use this file except in compliance with the License.
;;; You may obtain a copy of the License at
;;;
;;;     http://www.apache.org/licenses/LICENSE-2.0
;;;
;;; Unless required by applicable law or agreed to in writing, software
;;; distributed under the License is distributed on an "AS IS" BASIS,
;;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;; See the License for the specific language governing permissions and
;;; limitations under the License.

(in-package "CCL")

(defparameter *openmcl-major-version* 1)
(defparameter *openmcl-minor-version* 14)
(defparameter *openmcl-revision* nil)
;;; May be set by xload-level-0
(defvar *openmcl-svn-revision* nil)
(defparameter *openmcl-dev-level* nil)

;;; The common-lisp.net edition (see CLNET-EDITION.md): it carries
;;; changes not yet in a Clozure CL release, and says so in
;;; LISP-IMPLEMENTATION-VERSION, which reads "1.14-clnet.N ...".
(defparameter *openmcl-edition* "clnet.1")

(defparameter *openmcl-version* (format nil "~d.~d~@[.~a~]~@[-~a~] ~@[(~a) ~]~~A"
					*openmcl-major-version*
					*openmcl-minor-version*
					(unless (null *openmcl-revision*)
					  *openmcl-revision*)
                                        *openmcl-edition*
					(if (and (typep *openmcl-svn-revision* 'string)
                                                 (> (length *openmcl-svn-revision*) 0))
                                          *openmcl-svn-revision*)))

;;; end
