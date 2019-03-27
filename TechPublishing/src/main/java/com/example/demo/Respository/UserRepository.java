package com.example.demo.Respository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.User;

import java.lang.String;
import java.util.List;


public interface UserRepository extends CrudRepository<User, Integer> {

	List<User> findByUsername(String username);


}
