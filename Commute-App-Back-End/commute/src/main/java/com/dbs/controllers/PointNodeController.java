package com.dbs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dbs.beans.PointNode;
import com.dbs.repositories.PointNodeRepository;

@RestController
@RequestMapping("/pointnode")
@CrossOrigin(origins = "*")
public class PointNodeController {
	
	@Autowired
	private PointNodeRepository repository;
	
	@GetMapping
	public List<PointNode> findAll() {
		return repository.findAll();
	}

}
