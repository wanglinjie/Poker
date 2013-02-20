requirejs.config {
    baseUrl: "static/js"
}

require(['jquery'], ($)->
    # .quit_system event 不能.
    $(".quit_system").on('click', (e)->
        alert("Quiting System!")
        window.opener = ''
        window.close()
        return false
    )

    $(".goto_home").on('click', (e)->
        window.location = $('.home').attr('href')
        return false
    )
    return true
)
