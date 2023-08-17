package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveUser(final User user) {
        userRepository.save(user);
    }

    public List<User> getUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(final Long id) {
        return userRepository.findById(id);
    }

    public void deleteUser(final User user) {
        userRepository.delete(user);
    }
}