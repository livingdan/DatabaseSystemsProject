package com.dbs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dbs.beans.LineSegment;
import com.dbs.repositories.LineSegmentRepository;
import com.dbs.services.GenericService;

@RestController
@RequestMapping("/linesegment")
@CrossOrigin(origins = "*")
public class LineSegmentController {

	@Autowired
	private LineSegmentRepository repository;
	
	@Autowired
	private GenericService service;
	
	@GetMapping
	public List<LineSegment> findAll() {
		return repository.findAll();
	}
	
	@GetMapping("/{id}")
	public List<LineSegment> findByLineType(@PathVariable int id) {
		return repository.findByLineType(id);
	}
	
	@PostMapping
	public LineSegment saveLineSegment(@RequestBody LineSegment lineSegment) {
		return service.savePolyline(lineSegment);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable int id) {
		service.deletePolylineByLineId(id);
		repository.deleteById(id);
	}
}
