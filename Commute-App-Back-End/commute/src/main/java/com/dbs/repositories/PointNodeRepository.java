package com.dbs.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dbs.beans.PointNode;

@Repository
public interface PointNodeRepository extends JpaRepository<PointNode, Integer> {

	@Query("From PointNode pn where pn.amenity.id = ?1")
	public List<PointNode> findByAmenity(int id);

}
