package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.repository.BasketItemRepository;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BasketItemService {
    private final BasketItemRepository basketItemRepository;


}
