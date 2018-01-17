package com.mrc.board.controller;

public class BoardVO {
	public int getEpisodeid() {
		return episodeid;
	}

	public void setEpisodeid(int episodeid) {
		this.episodeid = episodeid;
	}

	public String getEpisodename() {
		return episodename;
	}

	public void setEpisodename(String episodename) {
		this.episodename = episodename;
	}

	public int getOpenyear() {
		return openyear;
	}

	public void setOpenyear(int openyear) {
		this.openyear = openyear;
	}

	private int episodeid;
	private String episodename;
	private int openyear;

	
}
