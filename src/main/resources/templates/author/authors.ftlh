<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>
    <br>
    <div>
        <a class="btn btn-primary btn-sm" href="/authors/create-author-page">Add</a>
    </div>
    <div>
        <table class="table border table-light table-striped mt-7" id="authorsTable">
            <thead>
                <tr>
                    <th>author id</th>
                    <th>name</th>
                    <th>surname</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <#list authors as author>
                    <tr data-author-id=${author.getId()}>
                        <td><a href="/authors/${author.getId()}">${author.getId()}</a></td>
                        <td>${author.getName()}</td>
                        <td>${author.getSurname()}</td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="window.location.href = '/authors/${author.id}/edit-author-page'">Edit</button>
                            <button class="btn btn-primary btn-sm" onclick="deleteAuthor('${author.id}','${(_csrf.token)!''}')">Delete</button>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</@c.page>