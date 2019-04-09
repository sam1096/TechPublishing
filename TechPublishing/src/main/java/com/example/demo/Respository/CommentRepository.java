package com.example.demo.Respository;

import org.springframework.data.repository.CrudRepository;
import com.example.demo.model.Comment;

public interface CommentRepository extends CrudRepository<Comment, Integer>{

}
