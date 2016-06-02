package com.tan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Report generated by hbm2java
 */
//@Entity
//@Table(name = "report", catalog = "crm")
@Entity(name = "report")
public class Report implements java.io.Serializable {

	private Integer idreport;
	private String title;
	private String author;
	private String content;

	public Report() {
	}

	public Report(String title, String author, String content) {
		this.title = title;
		this.author = author;
		this.content = content;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idreport", unique = true, nullable = false)
	public Integer getIdreport() {
		return this.idreport;
	}

	public void setIdreport(Integer idreport) {
		this.idreport = idreport;
	}

	@Column(name = "title", length = 45)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "author", length = 20)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "content", length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
