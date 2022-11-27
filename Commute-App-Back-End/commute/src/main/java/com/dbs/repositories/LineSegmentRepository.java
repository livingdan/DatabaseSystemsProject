package com.dbs.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dbs.beans.LineSegment;
import com.dbs.beans.PointNode;
import com.dbs.beans.Polyline;

@Repository
public interface LineSegmentRepository extends JpaRepository<LineSegment, Integer> {
	
	@Query("From LineSegment ls where ls.lineType.typeId = ?1")
	public List<LineSegment> findByLineType(int id);

}
