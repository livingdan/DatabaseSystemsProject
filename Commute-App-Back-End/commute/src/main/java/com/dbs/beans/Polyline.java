package com.dbs.beans;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="polyline")
public class Polyline {

	@Column(name="order")
	private int order;
	
	@Column(name="latitude")
	private double latitude;
	
	@Column(name="longitude")
	private double longitude;
	
	@ManyToOne
	@JoinColumn(name="line_id")
	private LineSegment lineSegment;
	
	public Polyline() {
		super();
	}

	public Polyline(int order, double latitude, double longitude, LineSegment lineSegment) {
		super();
		this.order = order;
		this.latitude = latitude;
		this.longitude = longitude;
		this.lineSegment = lineSegment;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public LineSegment getLineSegment() {
		return lineSegment;
	}

	public void setLineSegment(LineSegment lineSegment) {
		this.lineSegment = lineSegment;
	}

	@Override
	public int hashCode() {
		return Objects.hash(latitude, lineSegment, longitude, order);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Polyline other = (Polyline) obj;
		return Double.doubleToLongBits(latitude) == Double.doubleToLongBits(other.latitude)
				&& Objects.equals(lineSegment, other.lineSegment)
				&& Double.doubleToLongBits(longitude) == Double.doubleToLongBits(other.longitude)
				&& order == other.order;
	}

	@Override
	public String toString() {
		return "Polyline [order=" + order + ", latitude=" + latitude + ", longitude=" + longitude + ", lineSegment="
				+ lineSegment + "]";
	}


	
	
}
