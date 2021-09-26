package com.sample;

import java.util.Date;

public class ToDo {

	private int id;
	private String task;
	private Date deadline;
	private String member;
	private boolean isDone;

	public ToDo(int id, String task, Date deadline, String member, boolean isDone) {
		super();
		this.id = id;
		this.task = task;
		this.deadline = deadline;
		this.member = member;
		this.isDone = isDone;
	}

	public int getId() {
		return id;
	}

	public String getTask() {
		return task;
	}

	public Date getDeadline() {
		return deadline;
	}

	public String getMember() {
		return member;
	}

	public boolean isDone() {
		return isDone;
	}

}
