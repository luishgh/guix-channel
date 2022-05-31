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

(define-public emacs-lsp-bridge
  (let ((version "0.5") (commit "3b6e187215c5897055e97ea160198b963f525172")
        (revision "0"))
    (package
      (name "emacs-lsp-bridge")
      (version (git-version version revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/manateelazycat/lsp-bridge")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0h6s5nxv19n0p9lm8a13xmq1rb2xl9i10c3j006xgrzncaphgbpc"))))
      (build-system emacs-build-system)
      ;; NOTE: needed for tests
      (native-inputs (list emacs-orderless))
      ;; NOTE: emacs-all-the-icons is technically also optional (only
      ;; needed for tests), but i don't know if its really worth it to
      ;; not propagate it
      (propagated-inputs (list emacs-markdown-mode emacs-all-the-icons
                               emacs-posframe))
      (home-page "https://github.com/manateelazycat/lsp-bridge")
      ;; FIXME: when porting to guix proper, this probably isn't a good synopsis
      (synopsis "Fastest LSP client for Emacs")
      (description
       "Lsp-bridge's goal is to become the fastest LSP
client in Emacs.

Lsp-bridge uses python's threading technology to build caches that
bridge Emacs and LSP server.  Lsp-bridge will provide smooth completion
experience without compromise to slow down emacs' performance.")
      ;; FIXME: The man simply didn't include a License file
      (license license:expat))))
