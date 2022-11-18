package com.dbs.beans;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="line_type")
public class LineType {

	@Id
	@Column(name="type_id")
	private int typeId;
	
	@Column(name="type_description")
	private String typeDescription;

	
	public LineType() {
		super();
	}

	public LineType(int typeId, String typeDescription) {
		super();
		this.typeId = typeId;
		this.typeDescription = typeDescription;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	@Override
	public int hashCode() {
		return Objects.hash(typeDescription, typeId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LineType other = (LineType) obj;
		return Objects.equals(typeDescription, other.typeDescription) && typeId == other.typeId;
	}

	@Override
	public String toString() {
		return "LineType [typeId=" + typeId + ", typeDescription=" + typeDescription + "]";
	}
	
	
	
}
