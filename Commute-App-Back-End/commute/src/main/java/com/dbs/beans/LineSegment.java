package com.dbs.beans;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "line_segment")
public class LineSegment {

	@Id
	@Column(name = "line_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lineId;

	@Column(name = "text_field")
	private String textField;

	@ManyToOne
	@JoinColumn(name = "type_id")
	private LineType lineType;

	@OneToMany(mappedBy = "id.lineSegment")
	private List<Polyline> polylines;

	public LineSegment() {
		super();
	}

	public LineSegment(int lineId, String textField, LineType lineType, List<Polyline> polylines) {
		super();
		this.lineId = lineId;
		this.textField = textField;
		this.lineType = lineType;
		this.polylines = polylines;
	}

	public int getLineId() {
		return lineId;
	}

	public void setLineId(int lineId) {
		this.lineId = lineId;
	}

	public String getTextField() {
		return textField;
	}

	public void setTextField(String textField) {
		this.textField = textField;
	}

	public LineType getLineType() {
		return lineType;
	}

	public void setLineType(LineType lineType) {
		this.lineType = lineType;
	}

	public List<Polyline> getPolylines() {
		return polylines;
	}

	public void setPolylines(List<Polyline> polylines) {
		this.polylines = polylines;
	}

	@Override
	public int hashCode() {
		return Objects.hash(lineId, lineType, textField);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LineSegment other = (LineSegment) obj;
		return lineId == other.lineId && Objects.equals(lineType, other.lineType)
				&& Objects.equals(textField, other.textField);
	}

	@Override
	public String toString() {
		return "LineSegment [lineId=" + lineId + ", textField=" + textField + ", lineType=" + lineType + "]";
	}

}
