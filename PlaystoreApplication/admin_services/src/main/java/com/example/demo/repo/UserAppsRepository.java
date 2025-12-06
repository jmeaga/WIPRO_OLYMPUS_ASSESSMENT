package com.example.demo.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.UserApps;

import java.util.List;

public interface UserAppsRepository extends JpaRepository<UserApps, Integer> {

    List<UserApps> findByUserId(Integer userId);
    
    @Query("SELECT COUNT(u) FROM UserApps u WHERE u.appId = :appId")
    Integer countByAppId(@Param("appId") Integer appId);

}

