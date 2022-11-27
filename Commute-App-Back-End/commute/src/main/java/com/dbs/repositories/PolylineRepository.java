package com.dbs.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dbs.beans.PolyLineCompositKey;
import com.dbs.beans.Polyline;

@Repository
public interface PolylineRepository extends JpaRepository<Polyline, PolyLineCompositKey>{

}
