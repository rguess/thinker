package org.guess.core.orm;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.guess.core.jsonview.IdView;

import com.fasterxml.jackson.annotation.JsonView;

@MappedSuperclass
public abstract class IdEntity {

//	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "oracle_id")
//	@SequenceGenerator(name = "oracle_id", sequenceName = "oracle_id", allocationSize = 1)
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@JsonView(IdView.class)
	protected Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
