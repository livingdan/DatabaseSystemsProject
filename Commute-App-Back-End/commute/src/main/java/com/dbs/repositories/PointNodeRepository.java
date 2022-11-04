package com.dbs.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dbs.beans.PointNode;

@Repository
public interface PointNodeRepository extends JpaRepository<PointNode, Integer> {

}
