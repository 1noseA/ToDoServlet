package com.sample;

import java.util.Date;

public class ToDo {

	private int id;
	private String task;
	private Date deadline;
	private String member;
	private String finished;

	public ToDo(int id, String task, Date deadline, String member, String finished) {
		super();
		this.id = id;
		this.task = task;
		this.deadline = deadline;
		this.member = member;
		this.finished = finished;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getFinished() {
		return finished;
	}

	public void setFinished(String finished) {
		this.finished = finished;
	}

}
