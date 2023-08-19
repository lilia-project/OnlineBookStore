package org.project.OnlineBookStore.entity;

public enum StatusOrder {
    CREATED("ORDER CREATED"),
    COMPLETED("ORDER COMPLETED"),
    APPROVED("ORDER APPROVED");
    private final String statusField;

    StatusOrder(String statusField) {
        this.statusField = statusField;
    }

    public String getStatusField() {
        return statusField;
    }

}
