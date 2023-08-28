<#import "/parts/common.ftlh" as c>

<@c.page>
    <table id = "categoriesTable"  class="table border table-light table-striped mt-7">
        <thead>
            <tr>
                <th>ID</th>
                <th>name</th>
            </tr>
        </thead>
        <tbody>
            <tr data-book-id=${category.getId()}>
                <td>${category.getId()}</td>
                <td>${category.getName()}</td>
            </tr>
        </tbody>
    </table>
</@c.page>