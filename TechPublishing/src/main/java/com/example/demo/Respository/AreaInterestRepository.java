package com.example.demo.Respository;


import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.AreaInterest;


public interface AreaInterestRepository extends CrudRepository<AreaInterest, Integer>{
List<AreaInterest> findByAreaname(String areaname);
List<AreaInterest> findByAreaid(String areaid);
}
