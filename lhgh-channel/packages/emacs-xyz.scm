(define-module (lhgh-channel packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-symex
  (let ((commit "6dab41cf72fb5f25e0de30fde64fee960944a604") (version "1.0")
        (revision "0"))
    (package
      (name "emacs-symex")
      (version (git-version version revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/countvajhula/symex.el")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1p8x7q1hf3bbblm43b4w3kns8ns6zjsz008x7pgvinqwi78a6nfs"))))
      (build-system emacs-build-system)
      (propagated-inputs (list emacs-lispy
                               emacs-paredit
                               emacs-evil
                               emacs-evil-cleverparens
                               emacs-evil-surround
                               emacs-hydra
                               emacs-undo-tree))
      (home-page "https://github.com/countvajhula/symex.el")
      (synopsis "Evil way to edit Lisp symbolic expressions as trees in Emacs")
      (description
       "Symex mode is a vim-inspired way of editing Lisp code as
trees.  Entering symex mode allows you to reason about your code in
terms of its structure, similar to other tools like paredit and
lispy.")
      (license license:public-domain))))

(define-public emacs-pomm
  (package
    (name "emacs-pomm")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SqrtMinusOne/pomm.el")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "06if507c163fia28zzax735r7mwlpa5vi0mmgddyn3vxsirnh4qw"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "^resources/" %default-include)))
    (propagated-inputs (list emacs-alert emacs-transient))
    (home-page "https://github.com/SqrtMinusOne/pomm.el")
    (synopsis "Yet another implementation of pomodoro timer for Emacs")
    (description
     "An implementation of a Pomodoro timer for Emacs.  Distintive features
of this particular implementation:
@itemize
@item Managing the timer with transient.el (@code{pomm} command)
@item Persistent state between Emacs sessions.
  So one could close & reopen Emacs without interruption the timer.
@end itemize

Take a look at @code{pomm-update-mode-line-string} on how to setup this
package with a modeline.
Also take a look at README at
@url{https://github.com/SqrtMinusOne/pomm.el} for more information.")
    (license license:gpl3)))

(define-public emacs-org-roam-ui
  (package
    (name "emacs-org-roam-ui")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/org-roam/org-roam-ui")
                    (commit "9474a254390b1e42488a1801fed5826b32a8030b")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0v54vxh95izch74wz2dl2dkdqicbvshra55l6qvd4xl5qmfhpjdc"))))
    (build-system emacs-build-system)
    (arguments
     '(#:include (cons "^out/" %default-include)))
    (propagated-inputs (list emacs-org-roam emacs-simple-httpd emacs-websocket))
    (home-page "https://github.com/org-roam/org-roam-ui")
    ;; TRANSLATORS: "Zettelkasten" should not be translated.
    (synopsis "Graphical frontend for exploring your org-roam Zettelkasten")
    (description
     "Org-Roam-UI is a frontend for exploring and interacting with your
org-roam notes.
Org-Roam-UI is meant a successor of org-roam-server
that extends functionality of org-roam with a Web app that runs
side-by-side with Emacs.")
    (license license:gpl3)))
