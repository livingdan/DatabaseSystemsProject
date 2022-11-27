package com.dbs.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dbs.beans.LineType;

@Repository
public interface LineTypeRepository extends JpaRepository<LineType, Integer> {

}
