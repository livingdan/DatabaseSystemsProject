package com.dbs.beans;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Embeddable
public class PolyLineCompositKey implements Serializable {
	
	@ManyToOne()
	@JoinColumn(name="line_id")
	@JsonIgnore
	private LineSegment lineSegment;

	@Column(name="order")
	private int order;

	public PolyLineCompositKey() {
		super();
	}

	public PolyLineCompositKey(LineSegment lineSegment, int order) {
		super();
		this.lineSegment = lineSegment;
		this.order = order;
	}
	

	public LineSegment getLineSegment() {
		return lineSegment;
	}

	public void setLineSegment(LineSegment lineSegment) {
		this.lineSegment = lineSegment;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	@Override
	public int hashCode() {
		return Objects.hash(lineSegment, order);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PolyLineCompositKey other = (PolyLineCompositKey) obj;
		return Objects.equals(lineSegment, other.lineSegment) && order == other.order;
	}

	@Override
	public String toString() {
		return "PolyLineCompositKey [lineSegment=" + lineSegment + ", order=" + order + "]";
	}
	
	
}
