define-command source-dir -params 1 \
    -docstring 'source <DIR>
    Loads all kak files from DIR. Not recursive.' %{
    evaluate-commands %sh{
        for f in "$@"/*.kak; do
            echo "source ${f%/}"
        done
    }
}
