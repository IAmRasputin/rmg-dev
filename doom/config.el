;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(eval-after-load 'sly-mrepl
  `(define-key sly-mrepl-mode-map (kbd "<return>") 'newline-and-indent))
(eval-after-load 'sly-mrepl
  `(define-key sly-mrepl-mode-map (kbd "RET") 'newline-and-indent))
(eval-after-load 'sly-mrepl
  `(define-key sly-mrepl-mode-map (kbd "C-<return>") 'sly-mrepl-return))
(eval-after-load 'sly-mrepl
  `(define-key sly-mrepl-mode-map (kbd "C-RET") 'sly-mrepl-return))



(setq inferior-lisp-program "sbcl --noinform --no-linedit")

(map!
 :leader
 :map lisp-mode
 (:prefix ("k" . "lisp")
  :desc "evil jump item"                          "%" #'evil-jump-item
  :desc "ex command"                              ":" #'evil-ex
  :desc "Insert expr before (same level)"         "(" #'lisp-state-insert-sexp-before
  :desc "Insert expr after (same level)"          ")" #'lisp-state-insert-sexp-after
  :desc "goto end of expr"                        "$" #'sp-end-of-sexp
  :desc "goto start of expr"                      "0" #'sp-beginning-of-sexp
  :desc "absorb expr"                             "a" #'sp-absorb-sexp
  :desc "forward barf expr"                       "b" #'sp-forward-barf-sexp
  :desc "backward barf expr"                      "B" #'sp-backward-barf-sexp
  :desc "convolute expression"                    "c" #'sp-convolute-sexp
  :desc "delete symbol"                           "ds" #'sp-delete-symbol
  :desc "backward delete symbol"                  "Ds" #'sp-backward-delete-symbol
  :desc "delete word"                             "dw" #'sp-delete-word
  :desc "backward delete word"                    "Dw" #'sp-backward-delete-word
  :desc "delete expr"                             "dx" #'sp-kill-sexp
  :desc "backward delete expr"                    "Dx" #'sp-backward-kill-sexp
  :desc "unwrap and kill forward"                 "e" #'sp-splice-sexp-killing-forward
  :desc "unwrap and kill backward"                "E" #'sp-splice-sexp-killing-backward
  :desc "previous symbol"                         "h" #'sp-backward-symbol
  :desc "previous expr"                           "H" #'sp-backward-sexp
  :desc "switch to insert state"                  "i" #'evil-insert-state
  :desc "goto start of exp and insert"            "I" #'evil-insert-line
  :desc "next close-paren"                        "j" #'lisp-state-next-closing-paren
  :desc "join expression"                         "J" #'sp-join-sexp
  :desc "previous open-paren"                     "k" #'lisp-state-prev-opening-paren
  :desc "next symbol"                             "l" #'lisp-state-forward-symbol
  :desc "goto next expr"                          "L" #'sp-forward-sexp
  :desc "paste after"                             "p" #'evil-paste-after
  :desc "paste before"                            "P" #'evil-paste-before
  :desc "replace parent expr with current"        "r" #'sp-raise-sexp
  :desc "forward slurp expr"                      "s" #'sp-forward-slurp-sexp
  :desc "backward slurp expr"                     "S" #'sp-backward-slurp-sexp
  :desc "transpose expr"                          "t" #'sp-transpose-sexp
  :desc "undo"                                    "u" #'undo-tree-undo
  :desc "goto parent expr backwards"              "U" #'sp-backward-up-sexp
  :desc "redo"                                    "C-r" #'undo-tree-redo
  :desc "switch to visual state"                  "v" #'evil-visual-char
  :desc "switch to visual line state"             "V" #'evil-visual-line
  :desc "switch to visual block state"            "C-v" #'evil-visual-block
  :desc "wrap expr with parens"                   "w" #'lisp-state-wrap
  :desc "unwrap expression"                       "W" #'sp-unwrap-sexp
  :desc "copy expression"                         "y" #'sp-copy-sexp))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
