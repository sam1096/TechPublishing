package com.example.demo.Respository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Admin;


public interface AdminRepository extends CrudRepository<Admin, Integer>{

public List<Admin> findByAdminname(String adminname);
}
