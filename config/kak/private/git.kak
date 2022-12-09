define-command -docstring "Render git conflicted files" \
    git-show-conflicts %{ evaluate-commands %sh{
     output=$(mktemp -d "${TMPDIR:-/tmp}"/kak-git-conflicts.XXXXXXXX)/fifo
     mkfifo ${output}
     ( git diff --diff-filter=U --unified=0 | grep -Po '^diff --cc \K.*|^@@@( -[0-9]+,[0-9]+){2} \+\K[0-9]+(?=(,[0-9]+)? )| @@@.*' | sed -e '0~3{s/ @@@[ ]\?//}' | sed '2~3 s/$/\n1/g' | sed "N;N;N;s/\n/:/g" > ${output} 2>&1 ) > /dev/null 2>&1 < /dev/null &

     printf %s\\n "evaluate-commands -try-client '$kak_opt_toolsclient' %{
               edit! -fifo ${output} -scroll *conflicts*
               set-option buffer filetype grep
               set-option buffer grep_current_line 0
               hook -always -once buffer BufCloseFifo .* %{ nop %sh{ rm -r $(dirname ${output}) } }
           }"
}}

define-command git-conflicts-next-match -docstring 'Jump to the next conflict match' %{
    lsp-next-match '*conflicts*'
}

define-command git-conflicts-previous-match -docstring 'Jump to the previous conflict match' %{
    lsp-previous-match '*conflicts*'
}

define-command -hidden git-next-match -params 1 -docstring %{
    buffile
    Jump to next match in grep filetype buffile
} %{
    evaluate-commands -try-client %opt{jumpclient} %{
        buffer %arg{1}
        execute-keys "ge %opt{grep_current_line}g<a-l> /^[^:]+:\d+:<ret>"
        grep-jump
    }
    try %{ evaluate-commands -client %opt{toolsclient} %{ execute-keys gg %opt{grep_current_line}g } }
}

define-command -hidden git-previous-match -params 1 -docstring %{
    buffile
    Jump to previous match in grep filetype buffile
} %{
    evaluate-commands -try-client %opt{jumpclient} %{
        buffer %arg{1}
        execute-keys "ge %opt{grep_current_line}g<a-h> <a-/>^[^:]+:\d+:<ret>"
        grep-jump
    }
    try %{ evaluate-commands -client %opt{toolsclient} %{ execute-keys gg %opt{grep_current_line}g } }
}
