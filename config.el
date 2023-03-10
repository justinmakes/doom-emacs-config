;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Justin R"
      user-mail-address "justin@worldcrafters.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 22 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 24))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org-roam/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;; BEGIN USER CONFIG:
;;; REQUIRE PACKAGES HERE:
(require 'mu4e)
;; (require 'smtpmail)

;;; PROJECTILE
(setq
 projectile-project-search-path '("~/projects/" "~/projects/rust/"))

;;; PRINTING
(setq printer-name "HP_Color_LaserJet_Pro_m453-4") ; set default printer

;;; PDF TOOLS
;; (setq pdf-info-epdfinfo-program "/nix/store/bvq8qhwp611p2dhyfbs1i6vab5ygzajs-emacs-pdf-tools-20221007.1404/share/emacs/site-lisp/elpa/pdf-tools-20221007.1404/epdfinfo")

;;; ORG CONFIG
(setq org-roam-directory "~/org-roam/")
;; TODO: Figure out how to bind org roam sync to a keybinding!

(setq org-agenda-files '("~/org-roam/" "~/org-roam/mail/" "~/org-roam/daily/"))

;; org todo keywords
;; (after! org)
(setq org-todo-keywords
      ;; NOTE: Keywords after "|" will have a "done" state
      '((sequence "TRAY(i)" "WAIT(w@/!)" "NACT(n)" "PROJ(p@/!)" "SPRJ(P@/!)" "SCAN(l!)" "MAYB(f!)" "|" "REFR(r!)" "DONE(d!)" "CANC(c@)" "NO(N)")
        (sequence "[ ](T)" "|" "[X](D!)")))
        ;; (sequence "[ ](T)" "[-](A)" "[?](M)" "|" "[X](D)")))
(setq org-todo-keyword-faces
      ;; NOTE: Use 'list-colors-display' to see available colors
      '(("TRAY" . (:foreground "red" :weight bold))
        ("WAIT" . +org-todo-onhold)
        ;; ("NACT" . +org-todo-active)
        ("NACT" . (:foreground "yellow green" :weight bold))
        ("PROJ" . +org-todo-project)
        ("SPRJ" . +org-todo-project)
        ;; ("SPRJ" . (:foreground "MediumPurple3" :weight bold))
        ("SCAN" . (:foreground "medium aquamarine" :weight bold))
        ("MAYB" . (:foreground "salmon" :weight bold))
        ("REFR" . +org-todo-onhold)
        ("CANC" . +org-todo-cancel)
        ("NO" . +org-todo-cancel)))
        ;; ("[-]" . +org-todo-active)
        ;; ("[?]" . +org-todo-onhold)))

;; org custom agenda view
(setq org-agenda-sticky nil) ; When set to t, allows multiple agenda buffers to be open at once NOTE: Must manually refresh with 'r'
(setq org-agenda-sorting-strategy '((agenda habit-down time-up priority-down category-keep)
                                    (todo todo-state-down priority-down category-keep)
                                    (tags priority-down category-keep)
                                    (search category-keep)))
(setq org-agenda-block-separator 9472) ;use (describe-char) on a character to find numerical code
(setq org-agenda-prefix-format ; NOTE: The 4 prefix variables are %i %c %t and %s (see doc-string)
      '((agenda . " %i %?-12t% s")
        (todo . " %i")
        (tags . " %i %-12:c")
        (search . " %i %-12:c")))
        ;; (agenda . " %i %-12:c%?-12t% s")
        ;; (todo . " %i %-12:c")
(setq org-agenda-custom-commands
      '(("d" "GTD Daily Review"
         ((agenda "")
          (todo "NACT|WAIT" ((org-agenda-overriding-header "Next Actions(n):")))
          (todo "PROJ|SPRJ" ((org-agenda-overriding-header "Projects/Problems(p):")))
          (todo "TRAY" ((org-agenda-overriding-header "In Tray(i) [Emergency scan only!]:")))))
        ("i" "In Tray"
         ((todo "TRAY" ((org-agenda-overriding-header "In Tray(i):")))))
        ("n" "Next Actions"
         ((todo "NACT" ((org-agenda-overriding-header  "Next Actions(n):")))))
        ("w" "Waiting for"
         ((todo "WAIT" ((org-agenda-overriding-header "Waiting for(w):")))))
        ("p" "Projects"
         ((todo "PROJ|SPRJ" ((org-agenda-overriding-header "Projects(p):")))))
        ("f" "Maybe"
         ((todo "MAYB" ((org-agenda-overriding-header "Maybe(f):")))))
        ("l" "Reading List"
         ((todo "SCAN" ((org-agenda-overriding-header "Reading List(l)")))))
        ("r" "Reference"
         ((todo "REFR" ((org-agenda-overriding-header "Reference(r):")))))
        ("c" "Canceled"
         ((todo "CANC|NO" ((org-agenda-overriding-header "Canceled(c):")))))
        ("x" "Calendar Items"
         ((todo "[ ]" ((org-agenda-overriding-header "Calendar Items(x):")))))
        ("z" "GTD Weekly Review"
         ((todo "TRAY" ((org-agenda-overriding-header "In Tray(i):")))
          (todo "NACT" ((org-agenda-overriding-header "Next Actions(n):")))
          (agenda "")
          (todo "WAIT" ((org-agenda-overriding-header "Waiting for(w):")))
          (todo "PROJ|SPRJ" ((org-agenda-overriding-header "Projects/Problems(p):")))
          (todo "MAYB" ((org-agenda-overriding-header "Maybe(f):")))
          (todo "SCAN" ((org-agenda-overriding-header "Reading list(l)")))
          (todo "REFR" ((org-agenda-overriding-header  "Reference(r):")))))))

;; dailies capture will record time of capture
;; check format-time-string docs for more info
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* TRAY %?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))

;; org-mode mail capture templates
 ;; NOTE: 'olp' in place of 'headline' allows you to capture to subheadings in addition to headings!
(setq org-capture-templates
      '(("e" "Mail Tray" entry (file+olp "~/org-roam/mail/mail.org" "MailTray")
         "* TRAY %:fromname: %a\nCREATED: %U\n%i" :immediate-finish t)))
        ;; ("e" "Mail to Today" entry (file "~/org-roam/daily/%Y-%m-%d.org")
        ;;  "* TRAY %:fromname: %a\n%i" :immediate-finish t)))
        ;; ("e" "Email To Tray" entry (file+headline "~/org-roam/tray/tray.org" "InTray")
        ;;  "* TRAY %:fromname: %a\nCREATED: %U\n%i" :immediate-finish t)
        ;; ("t" "Tray Capture Buffer" entry (file+headline "~/org-roam/tray/tray.org" "InTray")
        ;;  "* TRAY %?\nCREATED: %U")))

;; add custom mu4e actions for our capture templates
(defun efs/capture-mail-mailtray (msg)
  (interactive)
  (call-interactively 'org-store-link)
  (org-capture nil "e"))

;; Add custom actions for our capture templates
(add-to-list 'mu4e-headers-actions
             '("to mailtray" . efs/capture-mail-mailtray) t)
(add-to-list 'mu4e-view-actions
             '("to mailtray" . efs/capture-mail-mailtray) t)

;;; MU4E-SETTINGS
(setq mu4e-root-maildir "~/.mail"
      mu4e-get-mail-command "mbsync --config /home/justinr/.config/mbsync/config -a"
      mu4e-attachment-dir "~/attachments"
      message-send-mail-function 'smtpmail-send-it
      mu4e-compose-format-flowed t
      mml-secure-openpgp-signers '("4B78B6FF1ECB8DE3FB6703850399E1EEC9095742"))
(add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime) ;; sign all outgoing mail with your public key fingerprint
;; NOTE: format-flowed makes word wrapping on plain text emails work properly across different types of devices
(setq mu4e-bookmarks
      `((:name "All inboxes" :query "maildir:/apsis/INBOX OR maildir:/remoterealty/INBOX OR maildir:/worldcrafters/INBOX" :key ?i)
        (:name "All sent" :query "maildir:/apsis/Sent OR maildir:/remoterealty/Sent OR maildir:/worldcrafters/Sent" :key ?s)
        (:name "All drafts" :query "maildir:/apsis/Drafts OR maildir:/remoterealty/Drafts OR maildir:/worldcrafters/Drafts" :key ?d)
        (:name "All repos" :query "maildir:/apsis/Repo OR maildir:/remoterealty/Repo OR maildir:/worldcrafters/Repo" :key ?r)
        (:name "All trash" :query "maildir:/apsis/Trash OR maildir:/remoterealty/Trash OR maildir:/worldcrafters/Trash" :key ?g)
        (:name "All spam" :query "maildir:/apsis/Spam OR maildir:/remoterealty/Spam OR maildir:/worldcrafters/Spam" :key ?j)
        ;; ("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
        ("flag:unread AND NOT maildir:/apsis/Trash AND NOT maildir:/remoterealty/Trash AND NOT maildir:/worldcrafters/Trash" "Unread messages" ?u)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        (,(mapconcat 'identity
                     (mapcar
                      (lambda (maildir)
                        (concat "maildir:" (car maildir)))
                      mu4e-maildir-shortcuts) " OR ")
         "All mail" ?a)))

(setq mu4e-contexts
      `(,(make-mu4e-context
           :name "worldcrafters"
           :match-func
           (lambda (msg)
             (when msg
               (string-prefix-p "/worldcrafters" (mu4e-message-field msg :maildir))))
           :vars '((user-mail-address . "justin@worldcrafters.io")
                   (user-full-name . "Justin Ramos")
                   (smtpmail-smtp-user . "justin@worldcrafters.io")
                   (smtpmail-smtp-server . "mail.privateemail.com")
                   (smtpmail-smtp-service . 465)
                   (smtpmail-stream-type . ssl)
                   (mu4e-compose-signature . "Justin")
                   (mu4e-drafts-folder . "/worldcrafters/Drafts")
                   (mu4e-refile-folder . "/worldcrafters/Repo")
                   (mu4e-sent-folder . "/worldcrafters/Sent")
                   (mu4e-trash-folder . "/worldcrafters/Trash")))
        ,(make-mu4e-context
          :name "apsis"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/apsis" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "justin@apsis.co")
                  (user-full-name . "Justin Ramos")
                  (smtpmail-smtp-user . "justin@apsis.co")
                  (smtpmail-smtp-server . "mail.privateemail.com")
                  (smtpmail-smtp-service . 465)
                  (smtpmail-stream-type . ssl)
                  (mu4e-compose-signature . "Justin")
                  (mu4e-drafts-folder . "/apsis/Drafts")
                  (mu4e-refile-folder . "/apsis/Repo")
                  (mu4e-sent-folder . "/apsis/Sent")
                  (mu4e-trash-folder . "/apsis/Trash")))
        ,(make-mu4e-context
          :name "remoteRealty"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/remoterealty" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "justin@remoterealty.com")
                  (user-full-name . "Justin Ramos")
                  (smtpmail-smtp-user . "justin@remoterealty.com")
                  (smtpmail-smtp-server . "mail.privateemail.com")
                  (smtpmail-smtp-service . 465)
                  (smtpmail-stream-type . ssl)
                  (mu4e-compose-signature . "Justin R\nOperator - Remote Realty LLC\n480-333-0533\njustin@remoterealty.com\nremoterealty.com")
                  (mu4e-drafts-folder . "/remoterealty/Drafts")
                  (mu4e-refile-folder . "/remoterealty/Repo")
                  (mu4e-sent-folder . "/remoterealty/Sent")
                  (mu4e-trash-folder . "/remoterealty/Trash")))))
