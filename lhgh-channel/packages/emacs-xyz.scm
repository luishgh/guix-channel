(define-module (lhgh-channel packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-symex
  (let ((commit "6dab41cf72fb5f25e0de30fde64fee960944a604")
	(version "1.0")
	(revision "0"))
    (package
      (name "emacs-symex")
      (version (git-version version revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/countvajhula/symex.el")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "1p8x7q1hf3bbblm43b4w3kns8ns6zjsz008x7pgvinqwi78a6nfs"))))
      (build-system emacs-build-system)
      (propagated-inputs
       `(("emacs-lispy" ,emacs-lispy)
	 ("emacs-paredit" ,emacs-paredit)
	 ("emacs-evil" ,emacs-evil)
	 ("emacs-evil-cleverparens" ,emacs-evil-cleverparens)
	 ("emacs-evil-surround" ,emacs-evil-surround)
	 ("emacs-hydra" ,emacs-hydra)
	 ("emacs-undo-tree" ,emacs-undo-tree)))
      (home-page "https://github.com/countvajhula/symex.el")
      (synopsis "Evil way to edit Lisp symbolic expressions as trees in Emacs")
      (description
       "Symex mode is a vim-inspired way of editing Lisp code as
trees.  Entering symex mode allows you to reason about your code in
terms of its structure, similar to other tools like paredit and
lispy.")
      (license license:public-domain))))
