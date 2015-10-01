syn case match
syn keyword Statement SET IF THEN EXIT ELSE END_IF STORE COMPUTE FIND RETURN RETRIEVE CHECK END COPY CALL RESET

syn case ignore
syn region Comment start="^\s*#" end="$"

let b:current_syntax = "any"
