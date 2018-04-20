package com.kh.forest.manager.model.vo;

import org.springframework.stereotype.Component;

@Component
public class RankGender {
	private int rankId;
	private String rankName;
	private int rankAmuont;
	public int getRankId() {
		return rankId;
	}
	public void setRankId(int rankId) {
		this.rankId = rankId;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public int getRankAmuont() {
		return rankAmuont;
	}
	public void setRankAmuont(int rankAmuont) {
		this.rankAmuont = rankAmuont;
	}
	public RankGender(int rankId, String rankName, int rankAmuont) {
		super();
		this.rankId = rankId;
		this.rankName = rankName;
		this.rankAmuont = rankAmuont;
	}
	
	public RankGender() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RankGender [rankId=" + rankId + ", rankName=" + rankName + ", rankAmuont=" + rankAmuont + "]";
	}
	
}
