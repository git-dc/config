
;; counsel and swiper not available
(setq package-list '(company yasnippet ivy swiper counsel nlinum))

;; load emacs 24's package system. Add melpa repo.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/") ; many packages won't show under melpa stable
   t))
(package-initialize) ; load and activate packages


;; fetch the list of packages available

(unless package-archive-contents
  (package-refresh-contents))


;; install the missing packages

(dolist (package package-list)
  (unless (package-installed-p package)
	(package-install package)))


;; general emacs settings

(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4) ; tab is 4 chars
(setq indent-tabs-mode nil) ; force use of spaces
(setq inhibit-startup-screen t) ; inhibit the startup screen
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; open .h files in c++ mode
(delete-selection-mode 1) ; replace selected text if selected 


;; key bindings (use M-x describe-key RET <your key sequence>)

(defun kill-line-from-anywhere ()
  "Run `beginning-of-visual-line' and `kill-line' in sequence."
  (interactive)
  (beginning-of-visual-line)
  (kill-line))


(global-unset-key (kbd "<f1>"))
(global-unset-key (kbd "ESC <right>"))
(global-unset-key (kbd "ESC <left>"))
(global-unset-key (kbd "ESC <up>"))
(global-unset-key (kbd "ESC <down>"))
(global-unset-key (kbd "M-<right>"))
(global-unset-key (kbd "M-<left>"))
(global-unset-key (kbd "M-<right>"))
(global-unset-key (kbd "M-<left>"))
(global-unset-key (kbd "C-k"))

(global-set-key (kbd "C-k") 'kill-line-from-anywhere)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
(global-set-key (kbd "M-[ h") 'move-beginning-of-line)
(global-set-key (kbd "M-[ f") 'move-end-of-line)
(global-set-key (kbd "M-[ d") 'left-word)
(global-set-key (kbd "M-[ c") 'right-word)
(global-set-key [(control ?h)] 'backward-kill-word)
(global-set-key (kbd "C-a") 'help-command) ; help
(global-set-key (kbd "<ESC><left>") 'windmove-left)
(global-set-key (kbd "<ESC><right>") 'windmove-right)
(global-set-key (kbd "<ESC><up>") 'windmove-up)
(global-set-key (kbd "<ESC><down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;;(global-hl-line-mode t) ; highline current line

(show-paren-mode 1) ; highlight matching parens

(global-linum-mode t) ; always show line numbers

(setq linum-format "%-3d\u2502") ; 4 digits accounted for with left justification

(global-visual-line-mode 1) ; text wrapping

;; highlights the present line with a very faint glow

;;(set-face-attribute 'hl-line nil :background "#4C4C4C")
;;(set-face-attribute 'linum-highlight-face nil :weight 'bold :background "#4C4C4C" :foreground "#9FC59F")
;;(set-face-attribute 'linum nil :foreground "#537953")


;; flycheck

(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))




;; ivy
(ivy-mode)

;;(global-set-key (kbd "C-s") 'swiper)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "C-s") 'counsel)



;; yasnippets

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq yas/indent-line nil)
(yas-global-mode 1)

;; company abbreviation in the window using dabbrev and yasnippets search with company

(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (add-to-list 'company-backends '(company-dabbrev-code))
  (setq company-tooltip-limit 20) ; bigger popup window
  (setq company-idle-delay .3) ; decrease delay before aucompl popup appears
  (global-set-key (kbd "C-<down>") 'company-yasnippet)
  )

(set-face-attribute 'mode-line
                    nil
                    :foreground "gray80"
                    :background "gray20"
                    :box '(:line-width 1 :style released-button)
                    )
(set-face-attribute 'mode-line-inactive
                    nil
                    :foreground "gray80"
                    :background "gray50"
                    :box '(:line-width 1 :style releasedbutton)
                    )







