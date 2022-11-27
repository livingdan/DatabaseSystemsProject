package com.dbs.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dbs.beans.Amenity;

@Repository
public interface AmenityRepository extends JpaRepository<Amenity, Integer>{

}
