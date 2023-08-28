<#import "/parts/common.ftlh" as c>

<@c.page>
<table id = "authorsTable"  class="table border table-light table-striped mt-7">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Surname</th>
        </tr>
    </thead>
    <tbody>
        <tr data-book-id=${author.getId()}>
            <td>${author.getId()}</td>
            <td>${author.getName()}</td>
            <td>${author.getSurname()}</td>
        </tr>
    </tbody>
</table>
</@c.page>
