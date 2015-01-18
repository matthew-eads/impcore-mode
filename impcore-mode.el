(defvar impcore-mode-hook nil)

(defvar impcore-mode-map
	;;using make-sparse-keymap instead of make-keymap
	(let ((map (make-sparse-keymap)))
		;;this is default anyway, just an example
		(define-key map "\C-j" 'newline-and-indent)
		map)
	"Keymap for impcore major mode")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.imp\\'" . impcore-mode))

;;Might need to insert open-paren versions too: (if != if
;;(defconst impcore-font-lock-keywords-1
;;	(list
;;		'("\\<" . (regex-opt '("if" "define" "while" "begin" "set" "print" "val" "use" "check-expect" "check-error") t) . "\\>" . font-lock-variable-name-face))
;;		'("\\<\\if\\val\\define\\\\|use\\|check-expect\\(check-error\\(CTIVITY\\|PPLICATION\\)\\|DATA\\|MODEL\\|PARTICIPANT\\|T\\(OOL_LIST\\|RANSITION\\)\\|WORKFLOW\\)\\|MODEL\\|PARTICIPANT\\|T\\(OOL_LIST\\|RANSITION\\)\\|WORKFLOW\\)\\>" . font-lock-builtin-face))
;;   '("\\('\\w*'\\)" . font-lock-variable-name-face))
;;		"Minimal highlighting expressions for impcore mode")


(defconst impcore-font-lock-keywords-1
    (list
	'("\\<\\(if\\|define\\|val\\|use\\|check-expect\\|check-error\\|set\\|while\\|begin\\)\\>" . font-lock-builtin-face))
    "Minimal highlighting expressions for impcore mode")

(defvar impcore-font-lock-keywords impcore-font-lock-keywords-1 "Default highlighting for impcore mode")

;;Very sparse syntax table, really only handles comments right now
(defvar impcore-mode-syntax-table
	(let ((st (make-syntax-table)))
		(modify-syntax-entry ?? "w" st)
		(modify-syntax-entry ?# "w" st)
		(modify-syntax-entry ?\; "<" st)
		(modify-syntax-entry ?\n ">" st)
	st)
	"Syntax table for impcore-mode")

(defun impcore-mode ()
	"Major mode for editing impcore language files"
	(interactive)
	(kill-all-local-variables)
	(set-syntax-table impcore-mode-syntax-table)
	(use-local-map impcore-mode-map)
	(set (make-local-variable 'font-lock-defaults) '(impcore-font-lock-keywords))
	(setq major-mode 'impcore-mode)
	(setq mode-name "impcore")
	(run-hooks 'impcore-mode-hook))

(provide 'impcore-mode)