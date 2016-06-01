package com.tan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Announcement generated by hbm2java
 */
//@Entity
//@Table(name = "announcement", catalog = "crm")
@Entity(name = "announcement")
public class Announcement implements java.io.Serializable {

	private Integer idannouncement;
	private String title;
	private String date;
	private String content;

	public Announcement() {
	}

	public Announcement(String title, String date, String content) {
		this.title = title;
		this.date = date;
		this.content = content;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idannouncement", unique = true, nullable = false)
	public Integer getIdannouncement() {
		return this.idannouncement;
	}

	public void setIdannouncement(Integer idannouncement) {
		this.idannouncement = idannouncement;
	}

	@Column(name = "title", length = 45)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "date", length = 45)
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "content", length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
