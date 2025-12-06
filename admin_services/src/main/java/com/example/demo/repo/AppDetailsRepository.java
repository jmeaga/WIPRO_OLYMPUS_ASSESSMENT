package com.example.demo.repo;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.model.AppDetails;
import java.util.List;

@Repository
public interface AppDetailsRepository extends JpaRepository<AppDetails, Integer> {

    List<AppDetails> findByGenre(String genre);

}

