<#macro page>
    <!doctype html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
                  name="viewport">
            <meta content="ie=edge" http-equiv="X-UA-Compatible">
            <title>Online book store</title>
            <link href="/css/styles1.css" rel="stylesheet">
            <link href="/css/error.css" rel="stylesheet">

            <script defer src="/js/book-edit.js"></script>
            <script defer src="/js/book-filter.js"></script>
            <script defer src="/js/book-delete.js"></script>
            <script defer src="/js/book-create.js"></script>
            <script defer src="/js/basket.js"></script>
            <script defer src="/js/wish-list-add.js"></script>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

        </head>

        <body>
            <div class="wrapper">
                <div class="content">
                    <script crossorigin="anonymous"
                            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
                    <script crossorigin="anonymous"
                            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                            src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
                    <script crossorigin="anonymous"
                            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                            src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
                    <#include "top-row.ftlh">
                    <#include "navbar.ftlh">
                    <#include "down-row.ftlh">
                    <div class="container mt-5">
                        <#nested>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </div>

                <div class="footer">
                    <footer class="bg-light">
                        <div class="container text-center">
                            <p>&copy; 2023 Bookstore. All rights reserved.</p>
                        </div>
                    </footer>
                </div>
            </div>
        </body>
    </html>
</#macro>