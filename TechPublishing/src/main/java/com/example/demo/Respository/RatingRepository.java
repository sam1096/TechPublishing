package com.example.demo.Respository;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.userRatings;

public interface RatingRepository  extends CrudRepository<userRatings,Integer>{
public userRatings findByArtidAndAuthname(int aid,String authname);
List<userRatings> findByArtid(int artid);
}
