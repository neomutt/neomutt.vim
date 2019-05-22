" Auto-detect a NeoMutt log file

autocmd BufRead * call <SID>neomutt_log()

function! s:neomutt_log()
	let match = '\v^\[\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d\] NeoMutt'

	let line = getline (1)
	if (line !~ match)
		return
	endif

	setfiletype neomuttlog
endfunction
