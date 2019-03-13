package com.example.demo.Respository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Admin;


public interface AdminRepository extends CrudRepository<Admin, Integer>{

	public Admin findByAdminnameAndPassword(String adminname, String password);
}
