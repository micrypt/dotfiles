(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq-default ispell-program-name "/usr/local/bin/aspell")

(color-theme-solarized-light)
