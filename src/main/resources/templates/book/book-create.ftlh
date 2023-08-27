<#import "/parts/common.ftlh" as c>

<@c.page>
    <form id="createForm" onsubmit="createBook(event)">
        <div class="row">
            <div class="col-md-3">
                <label for="name">Book name:</label>
                <input id="name" placeholder="name" required type="text">
            </div>
            <div class="col-md-3">
                <label for="price">Book price:</label>
                <input id="price" placeholder="price" required type="number">
            </div>
            <div class="col-md-3">
                <label for="stock">Book stock:</label>
                <input id="stock" placeholder="stock" required type="number">
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label for="bookAuthor">Book author:</label>
                <select class="form-select" id="bookAuthor">
                    <#list authors as author>
                    <option value="${author.id}">${author.name + ' '+ author.surname}</option>
                </#list>
                </select>
            </div>
            <div class="col-md-3">
                <label for="bookCategory">Book category:</label>
                <select class="form-select" id="bookCategory">
                    <#list categories as category>
                    <option value="${category.id}">${category.name}</option>
                </#list>
                </select>
            </div>
        </div>
        <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/>
        <button class="btn btn-success float-end" type="submit">Add new book</button>
    </form>
</@c.page>

