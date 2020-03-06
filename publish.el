(add-to-list 'load-path "/opt/buildhome/org-mode/lisp")
(require 'package)
(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(htmlize org))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'org)
(require 'ox-publish)

(defun publish-website ()
  "Publish the website."
  (org-version nil t t)
  (setq org-html-postamble nil)
  (setq org-publish-project-alist
        '(("website"
           :base-directory "./pages"
           :base-extension "org"
           :publishing-directory "./.public"
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t)))
  (org-publish-remove-all-timestamps)
  (org-publish-project "website")
  (message "done"))
