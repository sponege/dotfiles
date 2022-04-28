" init cursor position save slots
let g:cursorSaves = []

" fill save slots with empty saves
let i = 0
while i < 10
  let g:cursorSaves = g:cursorSaves + [[]]
  let i += 1
endwhile

function SaveCursor(number)
  " saves cursor position at slot <number>
  let cursor_pos = getcurpos()
  let g:cursorSaves[a:number] = cursor_pos
  echo printf("Saved cursor position (%i:%i) in slot %i", cursor_pos[1], cursor_pos[2], a:number)
endfunction

" all save key bindings
noremap <silent> bcs0 :call SaveCursor(0)<CR>
noremap <silent> bcs1 :call SaveCursor(1)<CR>
noremap <silent> bcs2 :call SaveCursor(2)<CR>
noremap <silent> bcs3 :call SaveCursor(3)<CR>
noremap <silent> bcs4 :call SaveCursor(4)<CR>
noremap <silent> bcs5 :call SaveCursor(5)<CR>
noremap <silent> bcs6 :call SaveCursor(6)<CR>
noremap <silent> bcs7 :call SaveCursor(7)<CR>
noremap <silent> bcs8 :call SaveCursor(8)<CR>
noremap <silent> bcs9 :call SaveCursor(9)<CR>

function LoadCursor(number)
  " loads cursor position at slot <number>
  let cursor_pos = g:cursorSaves[a:number]
  if len(cursor_pos) != 0
    " if cursor position was found
    call setpos('.', cursor_pos)
    echo printf("Teleported cursor to %i:%i", cursor_pos[1], cursor_pos[2])
  else
    " if no cursor position
    echo printf("Error: cannot load cursor position! no save was found at slot %i!", a:number)
  endif
endfunction

" all load key bindings
noremap <silent> bc0 :call LoadCursor(0)<CR>
noremap <silent> bc1 :call LoadCursor(1)<CR>
noremap <silent> bc2 :call LoadCursor(2)<CR>
noremap <silent> bc3 :call LoadCursor(3)<CR>
noremap <silent> bc4 :call LoadCursor(4)<CR>
noremap <silent> bc5 :call LoadCursor(5)<CR>
noremap <silent> bc6 :call LoadCursor(6)<CR>
noremap <silent> bc7 :call LoadCursor(7)<CR>
noremap <silent> bc8 :call LoadCursor(8)<CR>
noremap <silent> bc9 :call LoadCursor(9)<CR>
