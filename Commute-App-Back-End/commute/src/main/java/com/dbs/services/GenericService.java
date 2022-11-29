package com.dbs.services;

import java.sql.Types;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.dbs.beans.LineSegment;
import com.dbs.beans.Polyline;
import com.dbs.repositories.LineSegmentRepository;

@Service
public class GenericService {

	@Autowired
	private LineSegmentRepository lineSegmentRepository;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public LineSegment savePolyline(LineSegment lineSegment) {

		lineSegmentRepository.save(lineSegment);

		for (Polyline pl : lineSegment.getPolylines()) {
			String userSql = "insert into polyline(line_id, \"order\", latitude, longitude) values(?, ?, ?, ?)";
			jdbcTemplate.update(userSql,
					new Object[] { lineSegment.getLineId(), pl.getId().getOrder(), pl.getLatitude(),
							pl.getLongitude() },
					new int[] { Types.INTEGER, Types.INTEGER, Types.DOUBLE, Types.DOUBLE, });
		}

		return lineSegment;
	}

	public void deletePolylineByLineId(int id) {
		String userSql = "delete from polyline where line_id = " + id;
		jdbcTemplate.update(userSql);

	}
}
