<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>
    <br>
    <div>
        <a class="btn btn-primary btn-sm" href="/categories/create-category-page">Add</a>
    </div>
    <div>
        <table class="table border table-light table-striped mt-7" id="categoriesTable">
            <thead>
            <tr>
                <th>Category id</th>
                <th>Name</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
                <#list categories as category>
                    <tr data-category-id=${category.getId()}>
                        <td><a href="/categories/${category.getId()}"><p>${category.getId()}</a></td>
                        <td>${category.getName()}</td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="window.location.href = '/categories/${category.id}/edit-category-page'">Edit</button>
                            <button class="btn btn-primary btn-sm" onclick="deleteCategory('${category.id}','${(_csrf.token)!''}')">Delete</button>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</@c.page>