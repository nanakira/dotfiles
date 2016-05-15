;;; パッケージの設定
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(package-install 'go-autocomplete)
(package-install 'go-eldoc)
(package-install 'go-mode)

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>> BASIC SETTINGS
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;;; splash screenを無効にする
(setq inhibit-splash-screen t)

;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; Mute beep
(setq ring-bell-function 'ignore)

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>> HYSTORY
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;;; C-u C-SPC C-SPC …でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)

;;; ファイルを開いた位置を保存する
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

;;; ログの記録行数を増やす
(setq message-log-max 10000)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;; create backup file in ~/.emacs.d/backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; create auto-save file in ~/.emacs.d/backup
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))


;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>> VIEW
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; 現在行に色をつける
(global-hl-line-mode 1)

;;; メニューバーとツールバーを消す
(menu-bar-mode -1)
(tool-bar-mode -1)

;;; モードラインに時刻を表示する
(display-time)

;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)

;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+")

;;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)

;;; 釣合う括弧をハイライトする
(show-paren-mode 1)

;;; Tab width 4
(setq default-tab-width 4)

;;; Theme
(load-theme 'tsdh-dark t)

;;; Font
(set-frame-font "源ノ角ゴシック Code JP R-14")


;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>> EDIT
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)


;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>> KEY BINDS
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-t") 'other-window)
(global-set-key (kbd "C-x C-b") 'bs-show)




