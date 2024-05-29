;; Disable TLS v1.1, and v1.0
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.1:-VERS-TLS1.0")
