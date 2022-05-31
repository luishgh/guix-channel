(define-module (lhgh-channel packages image)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages image)
  #:use-module (gnu packages animation)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake))

(define-public tgs2png
  (let ((version "0.1.0")
        (commit "25c15b7c2ca3b1a580a383d9d3cb13bf8531d04a")
        (revision "0"))
    (package
      (name "tgs2png")
      (version (git-version version revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/zevlg/tgs2png")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0camvzapkfvr9v0nkk96n26rdmw0g8wbpv41i5l03j6bzdgm4myl"))))
      (build-system cmake-build-system)
      (arguments
       '(#:tests? #f))
      (native-inputs (list pkg-config))
      (inputs (list libpng rlottie))
      (home-page "https://github.com/zevlg/tgs2png")
      (synopsis "Convert Telegram's TGS format into PNG images")
      (description
       "Convert Telegram's animated stickers in TGS format into series of PNG images.")
      (license license:gpl3))))
