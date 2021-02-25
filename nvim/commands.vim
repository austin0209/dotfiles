if has("win32")
  command! Config execute ":e ~/AppData/Local/nvim/init.vim"
  command! Reload execute "source ~/AppData/Local/nvim/init.vim"
endif

augroup rust_commands
  autocmd!
  autocmd FileType rust nnoremap <buffer> <silent><leader>rsf :RustFmt<CR>
  autocmd FileType rust command! CargoCheck execute ":Dispatch cargo check"
  autocmd FileType rust command! CargoBuild execute ":Dispatch cargo build"
  autocmd FileType rust command! CargoRun execute ":Dispatch cargo run"
augroup end