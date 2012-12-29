(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-view-predicate-list nil)
 '(TeX-view-program-list (quote (("sumatrapdf" "D:\\Software\\CTEX\\CTeX\\ctex\\bin\\SumatraPDF.exe %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "sumatrapdf") (output-html "start"))))
 '(nil nil t)
 '(preview-auto-cache-preamble nil)
 '(preview-scale-function 1.3 t)
 '(preview-transparent-color nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t))

 ;; 设置光标为竖线
(setq-default cursor-type 'bar)


 ;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 12")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "新宋体" :size 15)))

 
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)




;



;解决emacs shell 乱码
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);关闭customize窗口

(setq column-number-mode t)
(auto-image-file-mode)

;; 在 mode-line 上显示时间。
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

(setq inhibit-startup-message t);关闭开启画面
(menu-bar-mode nil) ; 无菜单栏
(tool-bar-mode -1); 无工具栏
(scroll-bar-mode -1);无滚动条

;;显示行号
(global-linum-mode t)

(setq default-directory"e:\\tsinghua\\")

(setq x-select-enable-clipboard t)
 ;;写文件的编码方式
(set-buffer-file-coding-system 'utf-8)
;;新建文件的编码方式
(setq default-buffer-file-coding-system 'utf-8)
;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)
;;键盘输入的编码方式
;;读取或写入文件名的编码方式
;;(setq file-name-coding-system 'utf-8)

;; get around the Ctrl+SPACE key binding for inputing method
(global-set-key "\C-cm" 'set-mark-command)

;;换行对齐
(global-set-key [(control return)] 'vi-open-next-line)

(defun vi-open-next-line (arg)
 "Move to the next line (like vi) and then opens a line."
 (interactive "p")
 (end-of-line)
 (open-line arg)
 (next-line 1)
 (indent-according-to-mode))

 ;; 拷贝当前行
;;很多时候我们想把光标所在的整行语句放到kill-ring(Windows下的剪贴板）里。但选取整行，CTRL-W还是太烦琐。SlickEdit里，如果没有任何区域被选中，COPY命令会自动拷贝光标所在的整行，CUT则剪取光标所在地整行。Emacs下可以这么做：
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position) 
   (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position) 
   (line-beginning-position 2)))))



;;(global-set-key [(control return)] 'end-of-line-newline)

;; highlight marked region
;;(transient-mark-mode t)

;; enable syntax highlight
;;(global-font-lock-mode t)



(server-start)
(add-hook 'LaTeX-mode-hook (lambda()
         
		 (setq TeX-auto-untabify t     ; remove all tabs before saving
                      TeX-engine 'xetex       ; use xelatex default
                      TeX-show-compilation t) ; display compilation windows
                (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
                (imenu-add-menubar-index)
                (define-key LaTeX-mode-map [(control tab)]  'TeX-complete-symbol)
				;;设置c-tab自动补全
				
		 (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode) -synctex=-1'  %t" TeX-run-TeX nil t))
           (TeX-PDF-mode t)
           (setq TeX-command-default "XeLaTeX")
           (setq TeX-save-query  nil )
           (setq TeX-show-compilation nil)))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq preview-scale-function 1.3)
(setq LaTeX-math-menu-unicode t)
(setq TeX-insert-braces nil)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;(add-to-list 'load-path "~/.emacs.d")
;(require 'color-theme)
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
(add-to-list 'load-path "~/.emacs.d")
 (require 'color-theme)
 (color-theme-initialize)
 (load-file "~/.emacs.d/color-theme-blackboard.el")
 (color-theme-blackboard)
	 
;(add-to-list 'load-path "~/.emacs.d")
;(require 'color-theme)
;(color-theme-initialize)
; (color-theme-dark-blue)
(global-set-key (kbd "RET") 'newline-and-indent)
;;启动时最大窗口
(run-with-idle-timer 0.0 nil 'w32-send-sys-command 61488)

;; 回车缩进
(setq c-basic-offset 4)
;;(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 
44 48 52 56 60 64 68 72 76 80 84 88 92 96))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (add-to-list 'load-path "~/.emacs.d")
(require 'sumatra-forward)
