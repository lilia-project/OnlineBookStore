package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Order;
import org.project.OnlineBookStore.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    private OrderRepository orderRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public void saveOrder(final Order order) {
        orderRepository.save(order);
    }

    public List<Order> getOrders() {
        return orderRepository.findAll();
    }

    public Optional<Order> getOrderById(final Long id) {
        return orderRepository.findById(id);
    }

    public void deleteOrder(final Order order) {
        orderRepository.delete(order);
    }
}
