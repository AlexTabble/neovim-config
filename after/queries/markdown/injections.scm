; extends

; Primary: standard language node capture
; (fenced_code_block
;   (info_string
;     (language) @injection.language)
;   (code_fence_content) @injection.content
;   (#set! injection.include-children))
;
; ; Fallback: raw info_string text extraction
; ; (handles empty language node)
; (fenced_code_block
;   (info_string) @_raw
;   (code_fence_content) @injection.content
;   (#lua-match? @_raw "^%s*%a")
;   (#gsub! @_raw "^%s*([a-zA-Z][a-zA-Z0-9_-]*).*$" "%1")
;   (#set! injection.language @_raw)
;   (#set! injection.include-children))
