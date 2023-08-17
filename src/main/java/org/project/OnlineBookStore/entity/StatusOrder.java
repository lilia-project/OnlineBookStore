package org.project.OnlineBookStore.entity;

public enum StatusOrder {
    CREATED("ORDER CREATED"),
    ACCEPTED("ORDER ACCEPTED"),
    PROCESSING("ORDER PROCESSING"),
    PAID("ORDER PAID"),
    READY("ORDER READY");

    private final String statusField;

    StatusOrder(String statusField) {
        this.statusField = statusField;
    }

    public String getStatusField() {
        return statusField;
    }

}
