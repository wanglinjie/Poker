requirejs.config {
    baseUrl: "static/js"
}

require(['jquery'], ($)->
    # .quit_system event 不能.
    $(".goto_home").on('click', (e)->
        window.location = $('.home').attr('href')
        return false
    )
)
