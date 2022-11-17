package com.dbs.beans;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="polyline")
public class Polyline {

	private int lineid;
	
	private int order;
	
	private double latitude;
	
	private double longitude;
	
}
