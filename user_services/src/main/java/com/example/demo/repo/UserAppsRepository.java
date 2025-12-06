package com.example.demo.repo;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.User;
import com.example.demo.model.UserApps;

import org.springframework.transaction.annotation.Transactional;


import java.util.List;
import java.util.Optional;

public interface UserAppsRepository extends JpaRepository<UserApps, Integer> {
	 
    List<UserApps> findByUserId(Integer userId);
    @Query("SELECT COUNT(u) FROM UserApps u WHERE u.appId = :appId")
    Integer countByAppId(@Param("appId") Integer appId);
    @Modifying
    @Transactional
    @Query("DELETE FROM UserApps ua WHERE ua.userId = :userId")
    int deleteByUserId(@Param("userId") Integer userId);

}

