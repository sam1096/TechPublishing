package com.example.demo.Respository;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.UserArea;

public interface UserAreaRepository  extends CrudRepository<UserArea, Integer>{
List<UserArea> findByUsername(String username);
List<UserArea> findByAreaid(String areaid);
}
