package com.dbs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dbs.beans.LineType;
import com.dbs.repositories.LineTypeRepository;

@RestController
@RequestMapping("/linetype")
@CrossOrigin(origins = "*")
public class LineTypeController {
	
	@Autowired
	private LineTypeRepository repository;
	
	@GetMapping
	public List<LineType> findAll(){
		return repository.findAll();
	}

}
