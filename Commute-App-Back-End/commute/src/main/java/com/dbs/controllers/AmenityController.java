package com.dbs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dbs.beans.Amenity;
import com.dbs.repositories.AmenityRepository;

@RestController
@RequestMapping("/amenity")
@CrossOrigin(origins = "*")
public class AmenityController {

	@Autowired
	private AmenityRepository repository;
	
	@GetMapping
	public List<Amenity> findAll(){
		return repository.findAll();
	}
}
