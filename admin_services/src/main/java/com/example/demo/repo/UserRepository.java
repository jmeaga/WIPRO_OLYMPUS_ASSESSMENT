package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // JpaRepository already provides methods like findAll() and deleteById()
}
