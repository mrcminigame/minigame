package com.mrc.board.controller;

public class BoardVO {
	public int getEpisodeid() {
		return episodeid;
	}

	public void setEpisodeid(int episodeid) {
		this.episodeid = episodeid;
	}

	public String getEpisoename() {
		return episoename;
	}

	public void setEpisoename(String episoename) {
		this.episoename = episoename;
	}

	public int getOpenyear() {
		return openyear;
	}

	public void setOpenyear(int openyear) {
		this.openyear = openyear;
	}

	private int episodeid;
	private String episoename;
	private int openyear;

	
}
