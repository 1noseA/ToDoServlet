package com.sample;

public class ToDo {

	private int id;
	private String task;
	private String deadline;
	private String member;
	private String finished;

	public ToDo(int id, String task, String deadline, String member, String finished) {
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

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
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
