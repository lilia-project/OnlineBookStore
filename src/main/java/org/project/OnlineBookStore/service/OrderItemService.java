package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.OrderItem;
import org.project.OnlineBookStore.repository.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderItemService {
    private final OrderItemRepository orderItemRepository;

    @Autowired
    public OrderItemService(OrderItemRepository orderItemRepository) {
        this.orderItemRepository = orderItemRepository;
    }

    public void saveOrderItem(final OrderItem orderItem) {
        orderItemRepository.save(orderItem);
    }

    public List<OrderItem> getOrderItems() {
        return orderItemRepository.findAll();
    }

    public Optional<OrderItem> getOrderItemById(final Long id) {
        return orderItemRepository.findById(id);
    }

    public void deleteOrderItem(final OrderItem orderItem) {
        orderItemRepository.delete(orderItem);
    }
}
