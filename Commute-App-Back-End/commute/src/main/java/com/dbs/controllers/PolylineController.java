package com.dbs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dbs.beans.Polyline;
import com.dbs.repositories.PolylineRepository;

@RestController
@RequestMapping("/polyline")
@CrossOrigin(origins = "*")
public class PolylineController {

	@Autowired
	private PolylineRepository repository;
	
	@GetMapping
	public List<Polyline> findAll() {
		return repository.findAll();
	}
}
