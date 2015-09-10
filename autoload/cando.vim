let s:cando_loaded = 0

function! cando#Init()
    " TODO load manifests
    echom 'cando#Init()'
endfunction

function! cando#Complete(findstart, base)

    if a:findstart
        " From :help complete-functions
        let l = getline('.')
        let s = col('.') - 1

        while s > 0 && l[s - 1] =~ '\a'
            let s -= 1
        endwhile

        echom 'Start is 'start

        return start
    else
        " Reset completions
        let g:cando_completions = []

        " TODO Use manifests
        let dict = [
            { word: 'date_format', menu: 'The date format' },
            { word: 'page_heading':, menu: 'The page heading' }
        ]

        return dict

        " Find matching keys
        for k in keys(dict)
            if k =~ '^' . a:base
                let res = {}
                let res.word = k
                let res.menu = dict[k]
                "
                " Add match to cmpletions list
                call add(g:cando_completions, res)
            endif
        endfor

        " Return completions list
        return g:cando_completions
    endif

endfunction

set completefunc=cando#Complete

let s:cando_loaded = 1

echom 'cando loaded'
