package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.entity.Role;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.entity.Wishlist;
import org.project.OnlineBookStore.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    private final BasketService basketService;
    private final WishlistService wishlistService;
    private final PasswordEncoder passwordEncoder;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public boolean addUser(final User user, final boolean isAdmin) {
        User userFromDb = userRepository.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        if (isAdmin) {
            user.setRoles(Collections.singleton(Role.ADMIN));
        } else {
            user.setRoles(Collections.singleton(Role.USER));
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));

        User saved = userRepository.save(user);

        basketService.saveBasket(createBasketForUser(saved));
        wishlistService.saveWishlist(createWishListForUser(saved));

        return true;
    }

    private Wishlist createWishListForUser(User user) {
        Wishlist wishlist = new Wishlist();
        wishlist.setUser(user);
        return wishlist;
    }

    private Basket createBasketForUser(User user) {
        Basket basket = new Basket();
        basket.setUser(user);
        basket.setTotal(0L);
        return basket;
    }
}
